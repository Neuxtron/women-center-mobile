import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:women_center_mobile/View/register/register_widget.dart';
import 'package:women_center_mobile/View/register/register_widget2.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('Assets/images/register2.png'),
                  fit: BoxFit.cover),
            ),
          ),
          SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RegisterWidget(),
                  SizedBox(height: 55),
                  AlreadyHaveAccount(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
