import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:women_center_mobile/Models/artikel_model/artikel_model.dart';
import 'package:women_center_mobile/Models/source/dummy_artikel.dart';

class ArtikelViewModel extends ChangeNotifier {
  final String _baseUrl = "https://api-ferminacare.tech/api/v1";

  // TODO: uncomment
  // List<ArtikelModel> _listArtikel = [];
  // TODO: dihapus atau comment
  List<ArtikelModel> _listArtikel = [DummyArtikel.artikelUntukmu];

  List<ArtikelModel> get listArtikel => _listArtikel;

  // TODO: token sementara
  final String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NSwiZnVsbF9uYW1lIjoiYWd1bmdiaGFza2FyYSIsImVtYWlsIjoiYWd1bmcxMjNAZ21haWwuY29tIiwicm9sZSI6InVzZXIiLCJleHAiOjE3MDIyMjQ2MTZ9.EB6vJaIH3SUoiScdn_n-hVHhc86uzeS6WpwezStqjpI";

  Future fetchAlllArtikel() async {
    const endpoint = "/articles";

    try {
      final response = await http.get(
        Uri.parse("$_baseUrl$endpoint"),
        headers: {
          "Authorization": "Bearer $token",
        },
      );
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body)["data"] as List;
        _listArtikel = jsonData.map((e) => ArtikelModel.fromJson(e)).toList();
        notifyListeners();
      } else {
        log(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<ArtikelModel?> fetchSingleArtikel(int id, String slug) async {
    try {
      final response = await http.get(
        Uri.parse("$_baseUrl/article/$slug"),
        headers: {
          "Authorization": "Bearer $token",
        },
      );
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body)["data"];
        ArtikelModel newArtikel = ArtikelModel.fromJson(jsonData);
        for (var artikel in _listArtikel) {
          if (artikel.id == id) {
            final index = _listArtikel.indexOf(artikel);
            _listArtikel[index] = newArtikel;
            notifyListeners();
            return newArtikel;
          }
        }
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<ArtikelModel?> fetchLatestArtikel() async {
    try {
      final response = await http.get(
        Uri.parse("$_baseUrl/article/latest"),
        headers: {
          "Authorization": "Bearer $token",
        },
      );
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body)["data"];
        ArtikelModel artikel = ArtikelModel.fromJson(jsonData);
        return artikel;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
