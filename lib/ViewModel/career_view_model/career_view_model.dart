import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:women_center_mobile/Models/karir_model/karir_model.dart';

class CareerViewModel extends ChangeNotifier {
  final String _baseUrl = "https://api-ferminacare.tech/api/v1";
  List<KarirModel> _listKarir = [];
  List<KarirModel> get listKarir => _listKarir;

  final String _token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NSwiZnVsbF9uYW1lIjoiYWd1bmdiaGFza2FyYSIsImVtYWlsIjoiYWd1bmcxMjNAZ21haWwuY29tIiwicm9sZSI6InVzZXIiLCJleHAiOjE3MDIyMjQ2MTZ9.EB6vJaIH3SUoiScdn_n-hVHhc86uzeS6WpwezStqjpI";

  Future fetchAllCareer() async {
    try {
      final response = await http.get(Uri.parse("$_baseUrl/careers"), headers: {
        "Authorization": "Bearer $_token",
      });

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body)["data"] as List;
        _listKarir = jsonData.map((e) => KarirModel.fromJson(e)).toList();
        notifyListeners();
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
