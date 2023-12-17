import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:women_center_mobile/Models/konseling_model/konseling_model.dart';
import 'dart:convert';
import '../../Models/utils/auth_service.dart';

class CounselingSessionViewModel extends ChangeNotifier {
  List<KonselingModel> _counselingsession = [];
  String get token => AuthService.token;
  List<KonselingModel> get conseling => _counselingsession;

  Future<void> fetchcounselingsession() async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://api-ferminacare.tech/api/v1/counselors/counseling-session'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        final dynamic jsonResponse = json.decode(response.body);

        if (jsonResponse['code'] == 200 &&
            jsonResponse['data'] is List<dynamic>) {
          final List<dynamic> data = jsonResponse['data'];

          if (data.isNotEmpty) {
            _counselingsession =
                data.map((item) => KonselingModel.fromJson(item)).toList();
            notifyListeners();
          } else {
            print('No CounselingSession available.');
          }
        } else {
          throw Exception('Invalid response format');
        }
      } else {
        throw Exception(
            'Failed to load CounselingSession. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching CounselingSession: $error');
    }
  }

  Future<KonselingModel?> fetchDetail(String id) async {
    try {
      final response = await http.get(
        Uri.parse(
            "https://api-ferminacare.tech/api/v1/counselors/counseling-session/$id"),
        headers: {
          "Authorization": "Bearer $token",
        },
      );
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body)["data"];
        final jsonJadwal = jsonData["schedules"] as List;

        String email = jsonData["email"];
        List<JadwalKonseling> jadwalSesi =
            jsonJadwal.map((e) => JadwalKonseling.fromJson(e)).toList();

        for (var konseling in _counselingsession) {
          if (konseling.id == id) {
            konseling.email = email;
            konseling.jadwalSesi = jadwalSesi;
          }
        }
        notifyListeners();
        return _counselingsession.firstWhere((konseling) => konseling.id == id);
      } else {
        log("status code:${response.statusCode}\n${response.body}");
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
