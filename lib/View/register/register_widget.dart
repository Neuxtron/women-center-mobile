import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:women_center_mobile/View/onboarding/onboarding.dart';
import 'package:women_center_mobile/ViewModel/register_view_model/register_view_model.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({Key? key}) : super(key: key);

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RegisterViewModel(),
      child: Center(
        child: Form(
          key: _formKey,
          child: Container(
            width: 377,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                widgetForm(),
                const SizedBox(height: 30),
                //---------------------- SIGN UP BUTTON ---------------------
                Container(
                  height: 48,
                  decoration: ShapeDecoration(
                    color: Color(0xFFF4518D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: InkWell(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        try {
                          var viewModel = Provider.of<RegisterViewModel>(
                              context,
                              listen: false);

                          var response = await viewModel.registerUser(
                            firstname: _firstnameController.text,
                            lastname: _lastnameController.text,
                            username: _usernameController.text,
                            phone: _phoneController.text,
                            email: _emailController.text,
                            password: _passwordController.text,
                          );

                          if (response.statusCode == 201) {
                            viewModel.register();
                            // Navigator.of(context).pop();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Onboarding()));
                          } else if (response.statusCode == 409) {
                            print('email sama');
                            final errorMessage = response.data['message'];
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Error'),
                                content: Text(errorMessage),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            // Handle other status codes if needed
                            print(
                                "Unexpected status code: ${response.statusCode}");
                          }
                        } catch (error) {
                          print("Error: $error");
                          if (error is DioError) {
                            print("DioError details: ${error.response?.data}");
                          }
                        }
                      }
                    },
                    child: const Center(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                        child: Text(
                          'Sign Up',
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget widgetForm() {
    return Container(
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          const SizedBox(height: 170),
          const Text(
            'Create Account',
            style: TextStyle(
              color: Color(0xFFF9F5F6),
              fontSize: 32,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              //-------------FIRST NAME--------------
              Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'First Name',
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
                      width: 180,
                      // height: 48,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        controller: _firstnameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Wajib diisi';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16),
              //-------------LAST NAME--------------
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Last Name',
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
                      width: 180,
                      // height: 48,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        controller: _lastnameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Wajib diisi';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          //------------------------ USERNAME ----------------------------
          Container(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Username',
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
                  child: Container(
                    width: 250,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      controller: _usernameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Username wajib diisi';
                        }

                        // Check for whitespace
                        if (value.contains(RegExp(r'\s'))) {
                          return 'Username tidak boleh mengandung spasi';
                        }

                        // Check for uppercase letters
                        if (value != value.toLowerCase()) {
                          return 'Username harus menggunakan huruf kecil semua';
                        }

                        return null;
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 12),
          //------------------------ PHONE NUMBER ----------------------------
          Container(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Phone Number',
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
                  child: Container(
                    width: 250,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      controller: _phoneController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nomor telepon wajib diisi';
                        }
                        if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                          return 'Nomor telepon hanya boleh berisi angka';
                        }

                        return null;
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 12),
          //------------------------ EMAIL ----------------------------
          Container(
            width: double.infinity,
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
                  child: Container(
                    width: 250,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      controller: _emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Alamat email wajib diisi';
                        }

                        // Check if the value is a valid email address
                        if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                            .hasMatch(value)) {
                          return 'Masukkan alamat email yang valid';
                        }

                        return null;
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 12),
          //------------------------ PASSWORD ----------------------------
          Container(
            width: double.infinity,
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
                  width: double.infinity,
                  child: Container(
                    width: 250,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none),
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: IconButton(
                          padding: const EdgeInsets.only(),
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                      ),
                      controller: _passwordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password wajib diisi';
                        }
                        if (!RegExp(r'^(?=.*[A-Z])').hasMatch(value)) {
                          return 'Password harus mengandung huruf besar';
                        }
                        if (!RegExp(r'^(?=.*[a-z])').hasMatch(value)) {
                          return 'Password harus mengandung huruf kecil';
                        }
                        if (!RegExp(r'^(?=.*\d)').hasMatch(value)) {
                          return 'Password harus mengandung angka';
                        }
                        return null;
                      },
                      obscureText: _obscureText,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                //--------------------------- CONFIRM PASSWORD --------------------------
                Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Confirm Password',
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
                        child: Container(
                          width: 250,
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none),
                              filled: true,
                              fillColor: Colors.white,
                              suffixIcon: IconButton(
                                padding: const EdgeInsets.only(),
                                icon: Icon(
                                  _obscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                              ),
                            ),
                            controller: _confirmpasswordController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Konfirmasi password kosong';
                              }
                              if (value != _passwordController.text) {
                                return 'Password tidak sesuai';
                              }
                              return null;
                            },
                            obscureText: _obscureText,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ]));
  }
}
