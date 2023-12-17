import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:women_center_mobile/Models/konselor_model/konselor_model.dart';

import '../../Models/utils/auth_service.dart';

class KonselorViewModel extends ChangeNotifier {
  final String _baseUrl = "https://api-ferminacare.tech/api/v1";
  String get token => AuthService.token;
  String _order_id =
      "109b04aa-e45b-4e4f-baa7-4d3d46c9950f"; // tolong di ganti dari postmannya

  List<KonselorModel> _listKonselor = [];
  List<KonselorModel> get listKonselor => _listKonselor;
  String get order_id => _order_id;

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

  Future<bool> booking(
      int konselorId, int paketId, List<DateTime?> listTanggal) async {
    final endpoint =
        "/booking?counselor_id=$konselorId&counseling_package_id=$paketId";
    List<DateTime> schedule = [];
    for (var tgl in listTanggal) {
      if (tgl != null) schedule.add(tgl);
    }

    try {
      final response = await http.post(
        Uri.parse("$_baseUrl$endpoint"),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(schedule
            .map((tgl) => {
                  "booking_date": DateFormat('yyyy-MM-dd').format(tgl),
                  "booking_time": DateFormat('hh:mm:ss').format(tgl),
                })
            .toList()),
      );
      log(response.statusCode.toString());
      if (response.statusCode == 201 || response.statusCode == 200) {
        // simpan ke variabel order_id
        final newOrderId = jsonDecode(response.body)["data"]["order_id"];
        _order_id = newOrderId;

        // simpan ke localstorage
        final prefs = await SharedPreferences.getInstance();
        log("Setting in localstorage: $newOrderId");
        prefs.setString("order_id", newOrderId);
        return true;
      } else {
        log(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
    return false;
  }

  Future bayar(int payment_code) async {
    // ambil data order_id
    // api-ferminacare.tech/api/v1/charge-payment?order_id=$order_id&payment_code=$payment_code
    //ketika berhasil arahnya kemana
    //===============kalau gak berhasil======================
    // ambil datanya data dari local_storage dengan nama order_id
  }
}
