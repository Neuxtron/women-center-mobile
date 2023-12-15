import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:women_center_mobile/Models/artikel_model/artikel_model.dart';
import 'package:women_center_mobile/Models/utils/auth_service.dart';

class ArtikelViewModel extends ChangeNotifier {
  final String _baseUrl = "https://api-ferminacare.tech/api/v1";

  List<ArtikelModel> _listArtikel = [];
  List<ArtikelModel> get listArtikel => _listArtikel;

  ArtikelModel? _latestArtikel;
  ArtikelModel? get latestArtikel => _latestArtikel;

  String get token => AuthService.token;

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
    log(token);
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
        _latestArtikel = artikel;
        notifyListeners();
        return artikel;
      } else {
        log(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
