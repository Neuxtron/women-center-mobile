//rafi taufiqurahman
import 'package:flutter/material.dart';
import 'package:glassmorphism_widgets/glassmorphism_widgets.dart';
import 'package:intl/intl.dart';
import 'dart:ui';

class WidgetHome1 extends StatefulWidget {
  const WidgetHome1({Key? key}) : super(key: key);

  @override
  State<WidgetHome1> createState() => _WidgetHome1State();
}

class _WidgetHome1State extends State<WidgetHome1> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        Container(
          width: 360,
          height: 145,
          // padding: const EdgeInsets.only(left: 6, right: 6, bottom: 19),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            color: const Color(0xFFF8E8EE),
            shadows: const [
              BoxShadow(
                color: Color(0x19212121),
                blurRadius: 24,
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 6,
              ),
              Column(
                children: [
                  // AnimatedSlideColumn()
                  Padding(
                    padding: const EdgeInsets.only(top: 19, left: 6),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NewPage()),
                        );
                      },
                      child: Container(
                        width: 74,
                        height: 106,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: ShapeDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment(0, 7),
                            colors: [
                              Color(0xFFF2F2F2),
                              Color(0xFF9747FF),
                            ],
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x19212121),
                              blurRadius: 24,
                              offset: Offset(0, 4),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: const Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // textDirection: TextDirection.ltr,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 9),
                                    child: Text(
                                      'Jumat',
                                      style: TextStyle(
                                        color: Color(0xFFF4518D),
                                        fontSize: 10,
                                        fontFamily: 'Raleway',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 9),
                                    child: Text(
                                      '15',
                                      style: TextStyle(
                                        color: Color(0xFFF4518D),
                                        fontSize: 40,
                                        fontFamily: 'Raleway',
                                        fontWeight: FontWeight.w600,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 14,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 9),
                                    child: Text(
                                      'September',
                                      style: TextStyle(
                                        color: Color(0xFFF4518D),
                                        fontSize: 10,
                                        fontFamily: 'Raleway',
                                        fontWeight: FontWeight.w400,
                                        height: 0.18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Navigasi ke halaman baru ketika kontainer 1 ditekan
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => NewPage()),
                          );
                        },
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            // Container 1
                            Padding(
                              padding: const EdgeInsets.only(top: 19),
                              child: Container(
                                width: 250,
                                height: 50,
                                decoration: ShapeDecoration(
                                  gradient: const LinearGradient(
                                    begin: Alignment(0.00, -16),
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color(0xFF9747FF),
                                      Color(0xFFFDCEDF)
                                    ],
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 12, top: 17),
                                      child: Text(
                                        'Temukan dukunganmu',
                                        style: TextStyle(
                                          color: Color(0xFF1F1F1F),
                                          fontSize: 14,
                                          fontFamily: 'Raleway',
                                          fontWeight: FontWeight.w600,
                                          height: 0.11,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 100, top: 22),
                                      child: Text(
                                        'Konseling',
                                        style: TextStyle(
                                          color: Color(0xFF4B4B4B),
                                          fontSize: 14,
                                          fontFamily: 'Raleway',
                                          fontWeight: FontWeight.w600,
                                          height: 0.11,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Container 2 (hijau)
                            Positioned(
                              left: 194,
                              top: 16,
                              child: Container(
                                width: 56,
                                height: 56,
                                padding: const EdgeInsets.all(8),
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFF8E8EE),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  shadows: const [
                                    BoxShadow(
                                      color: Color(0x19212121),
                                      blurRadius: 24,
                                      offset: Offset(0, 4),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(),
                                      child: Image.asset(
                                        'Assets/images/note_alt.png', // Ganti dengan path gambar Anda
                                        width: 24, // Sesuaikan ukuran gambar
                                        height: 24, // Sesuaikan ukuran gambar
                                        fit: BoxFit
                                            .cover, // Atur jenis tampilan gambar
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigasi ke halaman baru ketika kontainer 1 ditekan
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => NewPage()),
                          );
                        },
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            // Container 1
                            Padding(
                              padding: const EdgeInsets.only(),
                              child: Container(
                                width: 250,
                                height: 50,
                                decoration: ShapeDecoration(
                                  gradient: const LinearGradient(
                                    begin: Alignment(0.00, -16),
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color(0xFF9747FF),
                                      Color(0xFFFDCEDF)
                                    ],
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Column(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 69, top: 15),
                                      child: Text(
                                        'Masih bingung soal karir ?',
                                        style: TextStyle(
                                          color: Color(0xFF1F1F1F),
                                          fontSize: 14,
                                          fontFamily: 'Raleway',
                                          fontWeight: FontWeight.w600,
                                          height: 0.11,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 22),
                                      child: Text(
                                        'Women Center',
                                        style: TextStyle(
                                          color: Color(0xFF4B4B4B),
                                          fontSize: 14,
                                          fontFamily: 'Raleway',
                                          fontWeight: FontWeight.w600,
                                          height: 0.11,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Container 2 (hijau)
                            Positioned(
                              top: -3,
                              child: Container(
                                width: 56,
                                height: 56,
                                padding: const EdgeInsets.all(8),
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFF8E8EE),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  shadows: const [
                                    BoxShadow(
                                      color: Color(0x19212121),
                                      blurRadius: 24,
                                      offset: Offset(0, 4),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(),
                                      child: Image.asset(
                                        'Assets/images/mdi_work.png', // Ganti dengan path gambar Anda
                                        width: 24, // Sesuaikan ukuran gambar
                                        height: 24, // Sesuaikan ukuran gambar
                                        fit: BoxFit
                                            .cover, // Atur jenis tampilan gambar
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class NewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Page'),
      ),
      body: const Center(
        child: Text(
          'Halaman Baru',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class WidgetHomeKonselor extends StatefulWidget {
  const WidgetHomeKonselor({Key? key}) : super(key: key);

  @override
  State<WidgetHomeKonselor> createState() => _WidgetHomeKonselorState();
}

class _WidgetHomeKonselorState extends State<WidgetHomeKonselor> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        Container(
          width: 360,
          height: 145,
          // padding: const EdgeInsets.only(left: 6, right: 6, bottom: 19),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            color: const Color(0xFFF8E8EE),
            shadows: const [
              BoxShadow(
                color: Color(0x19212121),
                blurRadius: 24,
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 6,
              ),
              Column(
                children: [
                  // AnimatedSlideColumn()
                  Padding(
                    padding: const EdgeInsets.only(top: 19, left: 6),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NewPage()),
                        );
                      },
                      child: Container(
                        width: 74,
                        height: 106,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: ShapeDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment(0, 7),
                            colors: [
                              Color(0xFFF2F2F2),
                              Color(0xFF9747FF),
                            ],
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x19212121),
                              blurRadius: 24,
                              offset: Offset(0, 4),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: const Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // textDirection: TextDirection.ltr,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 9),
                                    child: Text(
                                      'Jumat',
                                      style: TextStyle(
                                        color: Color(0xFFF4518D),
                                        fontSize: 10,
                                        fontFamily: 'Raleway',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 9),
                                    child: Text(
                                      '15',
                                      style: TextStyle(
                                        color: Color(0xFFF4518D),
                                        fontSize: 40,
                                        fontFamily: 'Raleway',
                                        fontWeight: FontWeight.w600,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 14,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 9),
                                    child: Text(
                                      'September',
                                      style: TextStyle(
                                        color: Color(0xFFF4518D),
                                        fontSize: 10,
                                        fontFamily: 'Raleway',
                                        fontWeight: FontWeight.w400,
                                        height: 0.18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Navigasi ke halaman baru ketika kontainer 1 ditekan
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => NewPage()),
                          );
                        },
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            // Container 1
                            Padding(
                              padding: const EdgeInsets.only(top: 19),
                              child: Container(
                                width: 250,
                                height: 50,
                                decoration: ShapeDecoration(
                                  gradient: const LinearGradient(
                                    begin: Alignment(0.00, -16),
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color(0xFF9747FF),
                                      Color(0xFFFDCEDF)
                                    ],
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 12, top: 17),
                                      child: Text(
                                        'Buat Artikel Untuk User',
                                        style: TextStyle(
                                          color: Color(0xFF1F1F1F),
                                          fontSize: 14,
                                          fontFamily: 'Raleway',
                                          fontWeight: FontWeight.w600,
                                          height: 0.11,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 124, top: 22),
                                      child: Text(
                                        'Artikel',
                                        style: TextStyle(
                                          color: Color(0xFF4B4B4B),
                                          fontSize: 14,
                                          fontFamily: 'Raleway',
                                          fontWeight: FontWeight.w600,
                                          height: 0.11,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Container 2 (hijau)
                            Positioned(
                              left: 194,
                              top: 16,
                              child: Container(
                                width: 56,
                                height: 56,
                                padding: const EdgeInsets.all(8),
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFF8E8EE),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  shadows: const [
                                    BoxShadow(
                                      color: Color(0x19212121),
                                      blurRadius: 24,
                                      offset: Offset(0, 4),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(),
                                      child: Image.asset(
                                        'Assets/images/note_alt.png', // Ganti dengan path gambar Anda
                                        width: 24, // Sesuaikan ukuran gambar
                                        height: 24, // Sesuaikan ukuran gambar
                                        fit: BoxFit
                                            .cover, // Atur jenis tampilan gambar
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigasi ke halaman baru ketika kontainer 1 ditekan
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => NewPage()),
                          );
                        },
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            // Container 1
                            Padding(
                              padding: const EdgeInsets.only(),
                              child: Container(
                                width: 250,
                                height: 50,
                                decoration: ShapeDecoration(
                                  gradient: const LinearGradient(
                                    begin: Alignment(0.00, -16),
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color(0xFF9747FF),
                                      Color(0xFFFDCEDF)
                                    ],
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Column(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 28, top: 15),
                                      child: Text(
                                        'Cek sesi dengan user',
                                        style: TextStyle(
                                          color: Color(0xFF1F1F1F),
                                          fontSize: 14,
                                          fontFamily: 'Raleway',
                                          fontWeight: FontWeight.w600,
                                          height: 0.11,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(top: 22, right: 47),
                                      child: Text(
                                        'Konseling',
                                        style: TextStyle(
                                          color: Color(0xFF4B4B4B),
                                          fontSize: 14,
                                          fontFamily: 'Raleway',
                                          fontWeight: FontWeight.w600,
                                          height: 0.11,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Container 2 (hijau)
                            Positioned(
                              top: -3,
                              child: Container(
                                width: 56,
                                height: 56,
                                padding: const EdgeInsets.all(8),
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFF8E8EE),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  shadows: const [
                                    BoxShadow(
                                      color: Color(0x19212121),
                                      blurRadius: 24,
                                      offset: Offset(0, 4),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(),
                                      child: Image.asset(
                                        'Assets/images/mdi_work.png', // Ganti dengan path gambar Anda
                                        width: 24, // Sesuaikan ukuran gambar
                                        height: 24, // Sesuaikan ukuran gambar
                                        fit: BoxFit
                                            .cover, // Atur jenis tampilan gambar
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
