import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../Models/utils/auth_service.dart';

class OnboardingViewModel with ChangeNotifier {

  void updateToken(String newToken) {
    AuthService.token = newToken;
    notifyListeners();
  }
}
class ApiOnboarding{
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> getUserProfile() async {
    try {
      final response = await _dio.get(
        'https://api-ferminacare.tech/api/v1/users/profile',
        options: Options(headers: {'Authorization': 'Bearer ${AuthService.token}'}),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;
        print('Full Name: ${data['full_name']}');
        return data;
      } else {
        throw Exception('Failed to load user profile');
      }
    } catch (error) {
      throw Exception('Failed to load user profile: $error');
    }
  }
}