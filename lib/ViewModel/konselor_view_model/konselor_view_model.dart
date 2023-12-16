import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:women_center_mobile/Models/konselor_model/konselor_model.dart';

import '../../Models/utils/auth_service.dart';

class KonselorViewModel extends ChangeNotifier {
  final String _baseUrl = "https://api-ferminacare.tech/api/v1";
  String get token => AuthService.token;

  List<KonselorModel> _listKonselor = [];
  List<KonselorModel> get listKonselor => _listKonselor;

  Future fetchAllKonselor() async {
    const endpoint = "/counselors";

    try {
      final response = await http.get(
        Uri.parse("$_baseUrl$endpoint"),
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body)["data"] as List;
        _listKonselor = jsonData.map((e) => KonselorModel.fromJson(e)).toList();
        notifyListeners();
      } else {
        log(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<int>?> fetchSchedule(int konselorId) async {
    final endpoint = "/counselors/$konselorId";

    try {
      final response = await http.get(
        Uri.parse("$_baseUrl$endpoint"),
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body)["data"]["schedule"] as List;
        List<int> schedule = KonselorModel.scheduleFromJson(jsonData);
        return schedule;
      } else {
        log(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
