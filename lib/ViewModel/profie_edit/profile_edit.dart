import 'package:dio/dio.dart';

class ApiProfil {
  final Dio _dio = Dio();
  String _authToken =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjYsImZ1bGxfbmFtZSI6InB1dHJpZGlhbmEiLCJlbWFpbCI6InB1dHJpZGlhbmFoZnN5d3RAZ21haWwuY29tIiwicm9sZSI6InVzZXIiLCJleHAiOjE3MDI3NTQ3Mjh9.dQfM-AJC2CV4S71uQ39GLz-R2Yxx09VvFPVRLmdL8DU';
  // Set the authentication token
  void setAuthToken(String token) {
    _authToken = token;
  }

  Future<Map<String, dynamic>> getUserProfile() async {
    try {
      final response = await _dio.get(
        'https://api-ferminacare.tech/api/v1/users/profile',
        options: Options(headers: {'Authorization': 'Bearer $_authToken'}),
      );
      print('$response');

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;
        print('User Profile Data:');
        print('ID: ${data['id']}');
        print('Username: ${data['username']}');
        print('Full Name: ${data['full_name']}');
        print('Email: ${data['email']}');
        print('Birthday: ${data['birthday']}');

        return data;
      } else {
        throw Exception('Failed to load user profile');
      }
    } catch (error) {
      throw Exception('Failed to load user profile: $error');
    }
  }

  Future<void> updateUserProfile(Map<String, dynamic> updatedData) async {
    print("Updating user profile with data: $updatedData");
    try {
      print('tambah update1');
      final responseUpdate = await _dio.put(
        'https://api-ferminacare.tech/api/v1/users/profile',
        data: updatedData,
        options: Options(
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjYsImZ1bGxfbmFtZSI6InB1dHJpZGlhbmEiLCJlbWFpbCI6InB1dHJpZGlhbmFoZnN5d3RAZ21haWwuY29tIiwicm9sZSI6InVzZXIiLCJleHAiOjE3MDI3NTQ3Mjh9.dQfM-AJC2CV4S71uQ39GLz-R2Yxx09VvFPVRLmdL8DU',
          },
        ),
      );
      print('Response from updateUserProfile: $responseUpdate');

      if (responseUpdate.statusCode == 201) {
        print('Perubahan profil disimpan dengan sukses');
        
      } else {
        print(
            'Gagal menyimpan perubahan profil. Status code: ${responseUpdate.statusCode}');
        // Tambahkan log atau tanggapan lainnya jika perlu
      }
    } catch (error) {
      print('Error updating user profile: $error');
    }
  }
}
