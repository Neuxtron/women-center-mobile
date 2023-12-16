import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'My App Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF9F5F6),
        elevation: 0,
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Tambahkan fungsi untuk kembali ke halaman sebelumnya
          },
        ),
        title: Text(
          'Tentang Kami',
          style: TextStyle(
            color: Color(0xFF0B0B0B),
            fontSize: 16,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w600,
            height: 0,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // Memposisikan teks di tengah
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 35),
              child: Text(
                'WOMAN',
                textAlign: TextAlign.center,
                style: GoogleFonts.raleway(
                  fontSize: 48,
                  fontWeight: FontWeight.w600,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 2
                    ..color = Color.fromARGB(255, 234, 50, 117),
                  // The desired stroke color
                ),
              ),
            ),
            // SizedBox(
            //   height: 3,
            // ),
            Text(
              'Center',
              textAlign: TextAlign.center,
              style: GoogleFonts.raleway(
                fontSize: 45,
                fontWeight: FontWeight.bold,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 2
                  ..color = Color.fromARGB(
                      255, 234, 50, 117), // The desired stroke color
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Tekstentangkami()
          ],
        ),
      ),
    );
  }
}

class Tekstentangkami extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        width: 325,
        height: 300,
        child: Text(
          'Women Center adalah sebuah organisasi yang berfokus pada pemberdayaan wanita untuk meraih potensi terbaik dan menciptakan perubahan positif dalam hidup mereka. Women Center ingin membangun sebuah platform online yang berfungsi sebagai pusat bantuan untuk wanita dan menyediakan ruang yang aman dan mendukung bagi wanita untuk mengakses informasi, sumber daya, dan dukungan terkait pertumbuhan pribadi, pengembangan profesional, dan kesejahteraan mereka.',
          textAlign: TextAlign.justify,
          style: TextStyle(
              color: Color(0xFF1F1F1F),
              fontSize: 12,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w400,
              height: 2.2),
        ),
      ),
    ]);
  }
}
