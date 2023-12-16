import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:women_center_mobile/Models/career_model/career.dart';
import '../../Models/utils/auth_service.dart';

class JobViewModel extends ChangeNotifier {
  List<Job> _jobs = [];
   String get token => AuthService.token;

  List<Job> get jobs => _jobs;

  Future<void> fetchJobs() async {
    try {
      final response = await http.get(
        Uri.parse('https://api-ferminacare.tech/api/v1/careers'),
         headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        final dynamic jsonResponse = json.decode(response.body);

        if (jsonResponse['code'] == 200 && jsonResponse['data'] is List<dynamic>) {
          final List<dynamic> data = jsonResponse['data'];
          
          if (data.isNotEmpty) {
            _jobs = data.map((item) => Job.fromJson(item)).toList();
            notifyListeners();
          } else {
            print('No jobs available.');
          }
        } else {
          throw Exception('Invalid response format');
        }
      } else {
        throw Exception('Failed to load jobs. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching jobs: $error');
    }
  }

}


