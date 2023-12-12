import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RegisterViewModel extends ChangeNotifier {
  bool _isRegistered = false;

  bool get isRegistered => _isRegistered;

  void register() {
    _isRegistered = true;
    notifyListeners();
  }

  Future<Response> registerUser({
    required String firstname,
    required String lastname,
    required String username,
    required String phone,
    required String email,
    required String password,
  }) async {
    try {
      Response response = await Dio().post(
        'http://api-ferminacare.tech/api/v1/users/register',
        data: {
          "first_name": firstname,
          "last_name": lastname,
          "username": username,
          "email": email,
          "password": password,
          "phone_number": phone,
          "address": "null",
        },
      );
      return response;
    } catch (error, stacktrace) {
      print("Exception occurred: $error stackTrace: $stacktrace");
      throw Exception("Failed to register user: $error");
    }
  }

  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  bool obscureText = true;

  void togglePasswordVisibility() {
    obscureText = !obscureText;
    notifyListeners();
  }
}
