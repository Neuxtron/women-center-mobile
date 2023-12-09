import 'package:flutter/material.dart';
import 'package:women_center_mobile/View/onboarding/onboarding.dart';
import 'package:women_center_mobile/View/splash_screen/splash_screen.dart';
import 'View/register/register.dart';


void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:'women center',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink)
      ),

    initialRoute: '/',
    routes: {
      '/': (context) => const Splashscreen(),
      '/register': (context) => const Register(),
      '/onboarding': (context) => const Onboarding(),
    }
    );
  }
}