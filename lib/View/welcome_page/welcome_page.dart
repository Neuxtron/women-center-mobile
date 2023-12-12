import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:glass_kit/glass_kit.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('Assets/images/welcome.jpg',
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.only(left: 100, right: 100, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 120),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, left: 10.0),
                    child: Stack(
                      children: <Widget>[
                        // Stroked text as a background
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 2.0),
                          child: Text(
                            'Women Center',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.raleway(
                              fontSize: 45,
                              fontWeight: FontWeight.bold,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 2
                                ..color = Color(
                                    0xFFF2BED1), // Warna stroke yang diinginkan
                            ),
                          ),
                        ),
                        Text(
                          'Women Center',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.raleway(
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(child: SizedBox()),
                GlassContainer(
                  width: 300,
                  height: 50,
                  borderRadius: BorderRadius.circular(10),
                  borderColor: Color(0xFFF2BED1),
                  borderWidth: 1,
                  blur: 10,
                  alignment: Alignment.center,
                  frostedOpacity: 0.1,
                  color: Colors.white
                      .withOpacity(0.2), // Atur warna latar belakang di sini
                  // borderGradient: LinearGradient(
                  //   begin: Alignment.topLeft,
                  //   end: Alignment.bottomRight,
                  //   colors: [
                  //     Colors.white.withOpacity(0.2),
                  //     Colors.white.withOpacity(0.2),
                  //   ],
                  // ),
                  child: MaterialButton(
                    onPressed: () {
                      // Aksi yang akan dijalankan saat tombol ditekan
                      Navigator.pushNamed(context, "/login");
                    },
                    
                    child: Text(
                      'Login',
                      
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 100,),

                // Row(
                //   children: [
                //     Expanded(
                //       child: Divider(
                //         color: Color(0XFFF2BED1),
                //         endIndent: 10,
                //       ),
                //     ),
                //     Text(
                //       'Or',
                //       style: TextStyle(color: Color(0XFFF2BED1)),
                //     ),
                //     Expanded(
                //       child: Divider(
                //         color: Color(0XFFF2BED1),
                //         indent: 10, //jarak kiri
                //       ),
                //     ),
                //   ],
                // ),
                // MaterialButton(
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(6),
                //     side: BorderSide(color: Colors.white),
                //   ),
                //   onPressed: () {},
                //   color: Color(0XFF483E42),
                //   child: Row(
                //     children: [
                //       Image.asset(
                //         'Assets/images/google.png',
                //         width: 25,
                //       ),
                //       SizedBox(
                //         width: 10,
                //       ),
                //       Text(
                //         'Login With Google',
                //         style: TextStyle(color: Colors.white),
                //       ),
                //     ],
                //   ),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}
