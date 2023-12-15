import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:women_center_mobile/Models/paket_model/paket.dart';

import '../../Models/utils/auth_service.dart';

class PaketViewModel extends ChangeNotifier {
  final String _baseUrl = "https://api-ferminacare.tech/api/v1";
  String get token => AuthService.token;

  List<PaketModel> _listPaket = [];
  List<PaketModel> get listPaket => _listPaket;

  Future fetchAllPaket() async {
    const endpoint = "/counseling-packages";

    try {
      final response = await http.get(
        Uri.parse("$_baseUrl$endpoint"),
        headers: {
          "Authorization": "Bearer $token",
        },
      );
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body)["data"] as List;
        _listPaket = jsonData.map((e) => PaketModel.fromJson(e)).toList();
        notifyListeners();
      } else {
        log(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
