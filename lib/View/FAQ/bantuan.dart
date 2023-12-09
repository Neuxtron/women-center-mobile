import 'package:flutter/material.dart';

class FAQ extends StatefulWidget {
  @override
  _FAQState createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  Color _warna1 = Colors.white;
  Color _textColor1 = Colors.black;
  Color _warna2 = Colors.white;
  Color _textColor2 = Colors.black;
  Color _warna3 = Colors.white;
  Color _textColor3 = Colors.black;
  Color _warna4 = Colors.white;
  Color _textColor4 = Colors.black;

  bool isExpanded = false;
  bool isExpanded2 = false;
  bool isExpanded3 = false;
  bool isExpanded4 = false;
  bool isExpanded5 = false;
  bool isExpanded6 = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: Center(
          child: Text(
            "Bantuan dan FAQ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    children: [
                      SizedBox(width: 8),
                      Text(
                        'Kategori Bantuan',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _warna1 =
                              (_warna1 == Colors.white)
                                  ? const Color.fromRGBO(244, 81, 141, 1)
                                  : Colors.white;
                          _textColor1 =
                              (_textColor1 == Colors.white)
                                  ? Colors.black
                                  : Colors.white;
                        });
                      },
                      child: Text('Informasi Umum',
                          style: TextStyle(color: _textColor1, fontSize: 14)),
                      style: ElevatedButton.styleFrom(primary: _warna1),
                    ),
                    SizedBox(width: 10.0),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _warna2 =
                              (_warna2 == Colors.white)
                                  ? const Color.fromRGBO(244, 81, 141, 1)
                                  : Colors.white;
                          _textColor2 =
                              (_textColor2 == Colors.white)
                                  ? Colors.black
                                  : Colors.white;
                        });
                      },
                      child: Text('Akun',
                          style: TextStyle(color: _textColor2, fontSize: 14)),
                      style: ElevatedButton.styleFrom(primary: _warna2),
                    ),
                    SizedBox(width: 10.0),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _warna3 =
                              (_warna3 == Colors.white)
                                  ? const Color.fromRGBO(244, 81, 141, 1)
                                  : Colors.white;
                          _textColor3 =
                              (_textColor3 == Colors.white)
                                  ? Colors.black
                                  : Colors.white;
                        });
                      },
                      child: Text('Jam Opersional',
                          style: TextStyle(color: _textColor3, fontSize: 14)),
                      style: ElevatedButton.styleFrom(primary: _warna3),
                    ),
                    SizedBox(width: 10.0),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _warna4 =
                              (_warna4 == Colors.white)
                                  ? const Color.fromRGBO(244, 81, 141, 1)
                                  : Colors.white;
                          _textColor4 =
                              (_textColor4 == Colors.white)
                                  ? Colors.black
                                  : Colors.white;
                        });
                      },
                      child: Text('Customer Service',
                          style: TextStyle(color: _textColor4, fontSize: 14)),
                      style: ElevatedButton.styleFrom(primary: _warna4),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 23, right: 23, bottom: 20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text(
                      'Apa saja fitur-fitur yang tersedia di aplikasi konseling wanita?',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                    trailing: IconButton(
                      icon: Icon(isExpanded ? Icons.remove : Icons.add, color: Color.fromRGBO(244, 81, 141, 1)),
                      onPressed: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                    ),
                  ),
                  if (isExpanded)
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Aplikasi konseling wanita menyediakan fitur-fitur seperti konseling online, konseling telepon, dan konseling chat. Selain itu, aplikasi ini juga menyediakan artikel-artikel tentang kesehatan mental dan kesehatan wanita.',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 0, left: 23, right: 23, bottom: 20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text(
                      'Bagaimana cara mendaftar sebagai konselor di aplikasi konseling wanita?',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                    trailing: IconButton(
                      icon: Icon(isExpanded2 ? Icons.remove : Icons.add, color: Color.fromRGBO(244, 81, 141, 1)),
                      onPressed: () {
                        setState(() {
                          isExpanded2 = !isExpanded2;
                        });
                      },
                    ),
                  ),
                  if (isExpanded2)
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Untuk mendaftar sebagai konselor di aplikasi konseling wanita, Anda perlu mengisi formulir pendaftaran yang tersedia di situs web aplikasi. Setelah itu, tim aplikasi akan memproses permohonan Anda dan memberikan informasi lebih lanjut tentang proses seleksi.',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 0, left: 23, right: 23, bottom: 20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text(
                      'Bagaimana cara memulai sesi konseling dengan klien?',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                    trailing: IconButton(
                      icon: Icon(isExpanded3 ? Icons.remove : Icons.add, color: Color.fromRGBO(244, 81, 141, 1)),
                      onPressed: () {
                        setState(() {
                          isExpanded3 = !isExpanded3;
                        });
                      },
                    ),
                  ),
                  if (isExpanded3)
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Setelah Anda terdaftar sebagai konselor di aplikasi konseling wanita, Anda dapat memulai sesi konseling dengan klien dengan mengakses fitur konseling online, konseling telepon, atau konseling chat yang tersedia di aplikasi. Anda juga dapat membuat janji temu dengan klien melalui aplikasi.',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 0, left: 23, right: 23, bottom: 20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text(
                      'Apa saja topik-topik yang dibahas dalam sesi konseling wanita?',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                    trailing: IconButton(
                      icon: Icon(isExpanded4 ? Icons.remove : Icons.add, color: Color.fromRGBO(244, 81, 141, 1)),
                      onPressed: () {
                        setState(() {
                          isExpanded4 = !isExpanded4;
                        });
                      },
                    ),
                  ),
                  if (isExpanded4)
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Beberapa topik yang dibahas dalam sesi konseling wanita meliputi kesehatan mental, hubungan, kecemasan, depresi, trauma, dan masalah-masalah lain yang berkaitan dengan kesehatan wanita.',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 0, left: 23, right: 23, bottom: 20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text(
                      'Bagaimana cara mengatasi masalah teknis saat menggunakan aplikasi ?',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                    trailing: IconButton(
                      icon: Icon(isExpanded5 ? Icons.remove : Icons.add, color: Color.fromRGBO(244, 81, 141, 1)),
                      onPressed: () {
                        setState(() {
                          isExpanded5 = !isExpanded5;
                        });
                      },
                    ),
                  ),
                  if (isExpanded5)
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Jika Anda mengalami masalah teknis saat menggunakan aplikasi konseling wanita, Anda dapat menghubungi tim dukungan pelanggan yang tersedia di aplikasi. Tim dukungan pelanggan akan membantu Anda menyelesaikan masalah teknis yang Anda alami.',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 0, left: 23, right: 23, bottom: 20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text(
                      'Apa saja layanan yang ada di Women Center?',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                    trailing: IconButton(
                      icon: Icon(isExpanded6 ? Icons.remove : Icons.add, color: Color.fromRGBO(244, 81, 141, 1)),
                      onPressed: () {
                        setState(() {
                          isExpanded6 = !isExpanded6;
                        });
                      },
                    ),
                  ),
                  if (isExpanded6)
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Women Center memiliki 3 layanan utama, yaitu:\n'
                        '-Konsultasi Online:\n'
                        '  Video Call, kamu dapat melakukan konsultasi tatap muka dengan konselor.\n'
                        '  Online Chat, kamu dapat melakukan konsultasi dengan Konselor melalui chat.\n\n'
                        '-Konsultasi Offline, kamu dapat konsultasi dengan bertatap muka langsung dengan konselor pada tempat yang sudah disediakan',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 75),
            Container(
              padding: EdgeInsets.all(16.0),
              color: Color(0xFFFDCEDF),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Ada pertanyaan lain? ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(width: 60),
                  InkWell(
                    onTap: () {
                      // Tindakan ketika "Customer Service" ditekan
                    },
                    child: Text(
                      'Customer Service',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
