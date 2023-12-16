import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:women_center_mobile/Models/career_model/filter_career.dart';
import '../../Models/utils/auth_service.dart';

class FilterJobTypesViewModel extends ChangeNotifier {
  List<FilterJobType> _filterjob = [];

  List<FilterJobType> get filterjob => _filterjob;

  // Metode untuk mengecek apakah filter aktif
  bool isFilterActive(String filterName) {
    // Implementasikan logika sesuai dengan kebutuhan Anda
    // Misalnya, cek apakah filterName ada dalam daftar filter yang aktif
    return false;
  }

  // Metode untuk mengganti status filter
  void toggleFilter(String filterName) {
    // Implementasikan logika untuk mengganti status filter
    // Misalnya, lakukan panggilan API untuk mengubah filter
  }
  String get token => AuthService.token;
  Future<void> fetchFilterJobTypes() async {
  try {
    final response = await http.get(
      Uri.parse('https://api-ferminacare.tech/api/v1/filter-job-types'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final dynamic jsonResponse = json.decode(response.body);

      if (jsonResponse['code'] == 200 && jsonResponse['data'] is List<dynamic>) {
        final List<dynamic> data = jsonResponse['data'];

        if (data.isNotEmpty) {
          _filterjob = data.map((item) => FilterJobType.fromJson(item)).toList();
          notifyListeners();

          // Tampilkan data yang diterima dari API
          // for (var filter in _filterjob) {
          //   print('Filter ID: ${filter.id}');
          //   print('Filter Name: ${filter.name}');
          //   print('Filter Description: ${filter.description}');
          //   print('----------------------');
          // }
        } else {
          print('No job types available.');
        }
      } else {
        throw Exception('Invalid response format');
      }
    } else {
      throw Exception('Failed to load job types. Status code: ${response.statusCode}');
    }
  } catch (error) {
    print('Error fetching job types: $error');
  }
}

}
