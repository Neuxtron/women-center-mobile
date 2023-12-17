import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:women_center_mobile/Models/konseling_model/konseling_model.dart';

import '../../Models/utils/auth_service.dart';

class KonselingKonselorViewModel extends ChangeNotifier {
  final String _baseUrl = "https://api-ferminacare.tech/api/v1";
  String get _token => AuthService.token;

  List<KonselingModel> _listKonseling = [];
  List<KonselingModel> get listKonseling => _listKonseling;

  Future fetchAllKonseling() async {
    const endpoint = "/counselors/counseling-session";

    try {
      final response = await http.get(
        Uri.parse("$_baseUrl$endpoint"),
        headers: {
          "Authorization": "Bearer $_token",
        },
      );
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body)["data"] as List;
        _listKonseling =
            jsonData.map((e) => KonselingModel.fromJson(e)).toList();
        notifyListeners();
      } else {
        log(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<KonselingModel?> fetchDetail(String id) async {
    final endpoint = "/counselors/counseling-session/$id";

    try {
      final response = await http.get(
        Uri.parse("$_baseUrl$endpoint"),
        headers: {
          "Authorization": "Bearer $_token",
        },
      );
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body)["data"];
        final jsonJadwal = jsonData["schedules"] as List;

        String email = jsonData["email"];
        List<JadwalKonseling> jadwalSesi =
            jsonJadwal.map((e) => JadwalKonseling.fromJson(e)).toList();

        for (var konseling in _listKonseling) {
          if (konseling.id == id) {
            konseling.email = email;
            konseling.jadwalSesi = jadwalSesi;
          }
        }
        notifyListeners();
        return _listKonseling.firstWhere((konseling) => konseling.id == id);
      } else {
        log(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
