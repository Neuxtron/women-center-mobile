import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:women_center_mobile/Models/login_model/model_login.dart';

class LoginViewModel {
  Future<bool> loginUser(LoginData loginData) async {
    print(loginData.email);
    print(loginData.password);
    String email = loginData.email;
    String password = loginData.password;
    String token = '';
    // token = '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'
    try {
      Map<String, String> data = {
        'email': email,
        'password': password,
      };

      final response = await http.post(
        Uri.parse('https://api-ferminacare.tech/api/v1/auth'),
        headers: <String, String>{
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data),
      );
      // Map<String, dynamic> responseData = json.decode(response.body);
      print(response.body);

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        if (responseData['code'] == 200 &&
            responseData['message'] == 'Authentication Success') {
          // Ambil data dari respons
          String fullName = responseData['data']['fullname'];
          String role = responseData['data']['role'];
          String email = responseData['data']['email'];
          String token = responseData['data']['token'];

          // Simpan data ke Shared Preferences
          await saveToSharedPreferences(fullName, role, email, token);

          // Kembalikan true karena login berhasil
          return true;
        } else {
          // Jika verifikasi gagal
          print('salah email dan password');
          return false;
        }
      } else {
        // Penanganan jika status code bukan 200
        print(
            'Response Status code bukan 200: tapi bernilai ${response.statusCode}');
        return false;
      }
    } catch (e) {
      // Tangani error yang terjadi selama pemanggilan API
      print('Error: $e');
      return false;
    }
  }

  Future<void> saveToSharedPreferences(
    String fullName,
    String role,
    String email,
    String token,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Simpan data ke Shared Preferences
    await prefs.setString('fullName', fullName);
    await prefs.setString('role', role);
    await prefs.setString('email', email);
    await prefs.setString('token', token);
  }
}

// //
//   Future<bool> loginUser(String email, String password) async {
//     final String apiUrl = 'https://contoh-url-api/login'; // Ganti dengan URL endpoint login Anda

//     final Map<String, String> requestData = {
//       'email': email,
//       'password': password,
//     };

//     final http.Response response = await http.post(
//       Uri.parse(apiUrl),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(requestData),
//     );

//     if (response.statusCode == 200) {
//       print('Login berhasil!');
//       return true;
//     } else {
//       print('Login gagal. Status code: ${response.statusCode}');
//       // Handle error di sini, misalnya menampilkan pesan kesalahan kepada pengguna
//       return false;
//     }
//   }



// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class LoginModel {
//   Future<void> login(String email, String password) async {
//     final Uri apiUrl = Uri.parse('https://api-ferminacare.tech/api/v1/auth');

//     try {
//       final response = await http.post(
//         apiUrl,
//         body: json.encode({
//           'email': email,
//           'password': password,
//         }),
//         headers: {
//           'Content-Type': 'application/json',
//         },
//       );

//       if (response.statusCode == 200) {
//         // Response berhasil, lakukan sesuatu (contoh: navigasi ke halaman setelah login)
//         print('Login successful!'); // Tampilkan pesan sukses di konsol
//       } else {
//         // Gagal melakukan login, mungkin menampilkan pesan error
//         print('Failed to login: ${response.statusCode}');
//       }
//     } catch (error) {
//       // Tangani error jika ada
//       print('Error while logging in: $error');
//     }
//   }
// }