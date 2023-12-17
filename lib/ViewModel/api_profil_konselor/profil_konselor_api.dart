import 'package:dio/dio.dart';
import 'package:women_center_mobile/Models/utils/auth_service.dart';

class ApiProfilKonselor {
  final Dio _dio = Dio();
  final String _authToken =
      // 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTAsImZ1bGxfbmFtZSI6IlZhbGVudGlubyBSb3NzaSIsImVtYWlsIjoidnI0NkBnbWFpbC5jb20iLCJyb2xlIjoiY291bnNlbG9yIiwiZXhwIjoxNzAyNzgyNjU1fQ.jIY07Q7nGHwd1gHT02DAIFGDFyYpCMCpdD0wc4KHhC8';
      AuthService.token;

  // void setAuthToken(String token) {
  //   _authToken = token;
  // }

  Future<Map<String, dynamic>> getUserProfile() async {
    try {
      final response = await _dio.get(
        'https://api-ferminacare.tech/api/v1/counselors/profile',
        options: Options(headers: {'Authorization': 'Bearer $_authToken'}),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;
        print('User Profile Data:');
        print('ID: ${data['id']}');
        print('Username: ${data['username']}');
        print('Full Name: ${data['full_name']}');
        print('Email: ${data['email']}');
        return data;
      } else {
        throw Exception('Failed to load user profile');
      }
    } catch (error) {
      throw Exception('Failed to load user profile: $error');
    }
  }
}
