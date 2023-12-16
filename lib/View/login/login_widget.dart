//Rafi Taufiqurahman Create LoginWidget
import 'package:flutter/material.dart';
import 'package:women_center_mobile/Models/login_model/model_login.dart';
import 'package:women_center_mobile/View/widgets/main_page.dart';
import 'package:women_center_mobile/View/widgets/main_page_konselor.dart';
import 'package:women_center_mobile/View/onboarding/onboarding.dart';
import 'package:women_center_mobile/View/register/register.dart';
import 'package:women_center_mobile/ViewModel/api_login/login_api.dart';

import '../../Models/utils/auth_service.dart';
import '../homepage/homepage_view.dart';

//widget tidak punya akun
class DonTHaveAnAccountSignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don’t have an account ?",
          style: TextStyle(
            color: Color(0xFFF9F5F6),
            fontSize: 12,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
        TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Register(),
                ),
              );
            },
            child: const Text(
              'Sign Up',
              style: TextStyle(
                color: Color(0xFFF2BED1),
                fontSize: 12,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline,
                height: 0,
              ),
            ))
      ],
    );
  }
}

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true; // Menentukan apakah password terlihat atau tidak
  String _massageError = '';

  final LoginViewModel _loginViewModel = LoginViewModel(); //import login api

  @override
  void initState() {
    super.initState();
    _emailController.text = "arman123@gmail.com";
    _passwordController.text = "Arman123";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 377,
          height: 370,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 240,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Login',
                      style: TextStyle(
                        color: Color(0xFFF9F5F6),
                        fontSize: 32,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      width: double.infinity,
                      height: 68,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Email',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 250,
                                  height: 28,
                                  // alignment: Alignment.center,
                                  padding: const EdgeInsets.only(),
                                  child: TextFormField(
                                    controller: _emailController,
                                    decoration: const InputDecoration(
                                      // contentPadding: EdgeInsets.only(top: 0.1),
                                      border: InputBorder.none,
                                      hintText: "Masukkan Email",
                                      hintStyle: TextStyle(
                                          color: Colors.grey, // Warna teks hint
                                          fontFamily: 'Raleway',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    style: const TextStyle(
                                      color: Colors.black, // Warna teks input
                                      fontFamily: 'Raleway',
                                      // Ganti dengan font family yang diinginkan
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    if (_massageError.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(left: 5, top: 5),
                        child: Text(
                          'Email $_massageError',
                          style: const TextStyle(
                            color: Color(0xFFFF0000),
                            fontSize: 12,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ),
                    const SizedBox(height: 12),
                    Container(
                      // width: double.infinity,
                      height: 68,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Password',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            // width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 345,
                                  height: 28,
                                  child: TextFormField(
                                    controller: _passwordController,
                                    obscureText: _obscureText,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Masukkan Password",
                                      hintStyle: const TextStyle(
                                          color: Colors.grey,
                                          fontFamily: 'Raleway',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                      suffixIcon: IconButton(
                                        padding: EdgeInsets.only(
                                            top: 2, bottom: 2, left: 18),
                                        icon: Icon(
                                          _obscureText
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Colors.grey,
                                          // size: 25,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _obscureText = !_obscureText;
                                          });
                                        },
                                      ),
                                    ),
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Raleway',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (_massageError.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 5, left: 5),
                        child: Text(
                          'Password $_massageError',
                          style: const TextStyle(
                            color: Color(0xFFFF0000),
                            fontSize: 12,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Container(
                height: 48,
                decoration: ShapeDecoration(
                  color: const Color(0xFFF4518D),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    //ambil data dari Controller
                    String email = _emailController.text;
                    String password = _passwordController.text;

                    // Buat objek LoginData dari input pengguna
                    LoginData loginData =
                        LoginData(email: email, password: password);
                    _loginViewModel.loginUser(loginData).then((loginResponse) {
                      if (loginResponse.sucess) {
                        print('ke halaman on boarding');
                        AuthService.token = loginResponse.token;
                        AuthService.role = loginResponse.role;

                        Navigator.pushReplacementNamed(context, "/onboarding");
                      } else {
                        // Tampilkan pesan kesalahan jika login gagal
                        setState(() {
                          _massageError = 'salah';
                        });
                      }
                    });
                  },
                  child: const Center(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                      child: Text(
                        'Login',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: AlignmentDirectional.centerEnd,
                // padding: EdgeInsets.only(),
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Color(0xFFF9F5F6),
                      fontSize: 12,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


// void _performLogin() {
  //   // Kredensial yang valid (contoh sederhana)
  //   final validEmail = 'rafi@gmail.com';
  //   final validPassword = '123';

  //   // Memeriksa apakah email dan password yang dimasukkan sama dengan kredensial yang valid
  //   if (_emailController.text == validEmail &&
  //       _passwordController.text == validPassword) {
  //     // Autentikasi berhasil, lakukan tindakan setelah login (misalnya, pindah ke halaman beranda)
  //     print('Login berhasil');
  //     // TODO: Pindah ke halaman beranda atau lakukan tindakan setelah login
  //   } else {
  //     // Autentikasi gagal, atur pesan kesalahan yang sesuai
  //     if (_emailController.text != validEmail) {
  //       setState(() {
  //         _usernameError = 'Email Tidak Terdaftar';
  //         _passwordError =
  //             ''; // Reset pesan error password jika sebelumnya ada pesan error
  //       });
  //     } else if (_passwordController.text != validPassword) {
  //       setState(() {
  //         _passwordError = 'Password salah';
  //         _usernameError =
  //             ''; // Reset pesan error username jika sebelumnya ada pesan error
  //       });
  //     }
  //   }
  // }
