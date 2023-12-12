import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:women_center_mobile/Models/karir_model/karir_model.dart';

import '../../Models/utils/auth_service.dart';

class CareerViewModel extends ChangeNotifier {
  final String _baseUrl = "https://api-ferminacare.tech/api/v1";
  List<KarirModel> _listKarir = [];
  List<KarirModel> get listKarir => _listKarir;

  final String _token = AuthService.token;

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
