import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:women_center_mobile/Models/career_model/detail_career.dart';
import '../../Models/utils/auth_service.dart';

class DetailJobViewModel extends ChangeNotifier {
  
  JobDetail? _jobDetail;

  JobDetail? get jobDetail => _jobDetail;
  String get token => AuthService.token;
  Future<void> fetchJobDetail(int jobId) async {
  try {
    final response = await http.get(
      Uri.parse('https://api-ferminacare.tech/api/v1/career/$jobId'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      _jobDetail = JobDetail.fromJson(data['data']);
      notifyListeners();
      
      // Tambahkan baris ini untuk mencetak respons API
    } else {
      throw Exception('Failed to load job detail');
    }
  } catch (error) {
    print('Error fetching job detail: $error');
  }
}

}
