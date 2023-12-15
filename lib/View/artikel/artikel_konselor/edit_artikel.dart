import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Edit_Artikel(),
  ));
}

class Edit_Artikel extends StatefulWidget {
  @override
  _Edit_ArtikelState createState() => _Edit_ArtikelState();
}

class _Edit_ArtikelState extends State<Edit_Artikel> {
  //input text
  TextEditingController _judulController = TextEditingController();
  TextEditingController _isiController = TextEditingController();

  //defaut teks
  String JudulArtikel = 'Cinta Beda Usia';
  String IsiArtikel = 'Di tempat ysabfbas aku ingin   safsaf sfsafsasa';

  @override
  void initState() {
    super.initState();
    _judulController = TextEditingController(text: JudulArtikel);
    _isiController = TextEditingController(text: IsiArtikel);
  }

  //color kategori
  Color _containerColor1 = Color(0xFFF9F5F6);
  Color _textColor1 = Color(0xFF636363);

  Color _containerColor2 = Color(0xFFF9F5F6);
  Color _textColor2 = Color(0xFF636363);

  Color _containerColor3 = Color(0xFFF9F5F6);
  Color _textColor3 = Color(0xFF636363);

  Color _containerColor4 = Color(0xFFF9F5F6);
  Color _textColor4 = Color(0xFF636363);

  Color _containerColor5 = Color(0xFFF9F5F6);
  Color _textColor5 = Color(0xFF636363);

  Color _containerColor6 = Color(0xFFF9F5F6);
  Color _textColor6 = Color(0xFF636363);

  //fungsi ganti warna
  void _changeColor(int containerNumber) {
    setState(() {
      if (containerNumber == 1) {
        _containerColor1 = _containerColor1 == Color(0xFFF9F5F6)
            ? Color(0xFFF4518D)
            : Color(0xFFF9F5F6);
        _textColor1 =
            _textColor1 == Color(0xFF636363) ? Colors.white : Color(0xFF636363);
      } else if (containerNumber == 2) {
        _containerColor2 = _containerColor2 == Color(0xFFF9F5F6)
            ? Color(0xFFF4518D)
            : Color(0xFFF9F5F6);
        _textColor2 =
            _textColor2 == Color(0xFF636363) ? Colors.white : Color(0xFF636363);
      } else if (containerNumber == 3) {
        _containerColor3 = _containerColor3 == Color(0xFFF9F5F6)
            ? Color(0xFFF4518D)
            : Color(0xFFF9F5F6);
        ;
        _textColor3 =
            _textColor3 == Color(0xFF636363) ? Colors.white : Color(0xFF636363);
        ;
      } else if (containerNumber == 4) {
        _containerColor4 = _containerColor4 == Color(0xFFF9F5F6)
            ? Color(0xFFF4518D)
            : Color(0xFFF9F5F6);
        ;
        _textColor4 =
            _textColor4 == Color(0xFF636363) ? Colors.white : Color(0xFF636363);
        ;
      } else if (containerNumber == 5) {
        _containerColor5 = _containerColor5 == Color(0xFFF9F5F6)
            ? Color(0xFFF4518D)
            : Color(0xFFF9F5F6);
        ;
        _textColor5 =
            _textColor5 == Color(0xFF636363) ? Colors.white : Color(0xFF636363);
        ;
      } else if (containerNumber == 6) {
        _containerColor6 = _containerColor6 == Color(0xFFF9F5F6)
            ? Color(0xFFF4518D)
            : Color(0xFFF9F5F6);
        ;
        _textColor6 =
            _textColor6 == Color(0xFF636363) ? Colors.white : Color(0xFF636363);
        ;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[100],
        elevation: 0,
        title: const Text(
          'Edit Artikel',
          style: const TextStyle(
            fontFamily: "Roboto",
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xff0b0b0b),
            height: 20 / 14,
          ),
        ),
        centerTitle: true, // Judul app bar
        leading: IconButton(
          // Tombol kembali di sebelah kiri
          icon: const Icon(Icons.arrow_back), color: Colors.black,
          onPressed: () {
            // Aksi ketika tombol kembali ditekan
            // Misalnya, kembali ke layar sebelumnya
            // Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          //.........................//
          child: Container(
            width: 365,
            height: 980,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Judul Artikel',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  width: 360,
                  height: 48,
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: 16,
                    right: 10,
                    bottom: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller: _judulController,
                    style: const TextStyle(
                      color: Color(0xFF1F1F1F),
                      fontSize: 14,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      // hintText:
                      //     'Enter text here', // Ganti dengan teks yang diinginkan
                      hintStyle: TextStyle(
                        color: const Color(0xFF1F1F1F).withOpacity(0.5),
                        fontSize: 14,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Upload Foto',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      width: 360,
                      height: 48,
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 16,
                        right: 10,
                        bottom: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 3) // Perpindahan bayangan (x, y)
                              ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Foto.jpg',
                            style: TextStyle(
                              color: Color(0xFF1F1F1F),
                              fontSize: 14,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            width: 24,
                            height: 24,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 24,
                                  height: 24,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    // color: Colors
                                    //     .grey, // Ganti dengan atribut yang diperlukan
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: const Icon(
                                    Icons.upload_file,
                                    color: Colors
                                        .grey, // Ganti dengan warna yang sesuai
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Container(
                  width: 360,
                  height: 540,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Isi Artikel',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        width: 360,
                        height: 500,
                        padding: const EdgeInsets.only(
                          top: 25,
                          left: 16,
                          right: 10,
                          bottom: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset:
                                    Offset(0, 3) // Perpindahan bayangan (x, y)
                                ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              controller: _judulController,
                              style: const TextStyle(
                                color: Color(0xFF1F1F1F),
                                fontSize: 16,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                            Container(
                              height: 200,
                              width: 333,
                              child: TextFormField(
                                controller: _isiController,
                                style: TextStyle(
                                  color: Color(0xFF1F1F1F),
                                  fontSize: 14,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.w400,
                                  height: 1.7,
                                ),
                                textAlign: TextAlign.left,
                                maxLines: null,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                //----------teks
                const Text(
                  'Kategori',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => _changeColor(1),
                            child: Container(
                              width: 120,
                              height: 31,
                              decoration: BoxDecoration(
                                color: _containerColor1,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Center(
                                child: Text(
                                  'Berita Wanita',
                                  style: TextStyle(
                                    color: _textColor1,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          GestureDetector(
                            onTap: () => _changeColor(2),
                            child: Container(
                              width: 120,
                              height: 31,
                              decoration: BoxDecoration(
                                color: _containerColor2,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Center(
                                child: Text(
                                  'Teknologi',
                                  style: TextStyle(
                                    color: _textColor2,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                        ],
                      ),
                      SizedBox(height: 20), // Adding space between the rows

                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => _changeColor(3),
                            child: Container(
                              width: 120,
                              height: 31,
                              decoration: BoxDecoration(
                                color: _containerColor3,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Center(
                                child: Text(
                                  'Karier',
                                  style: TextStyle(
                                    color: _textColor3,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          GestureDetector(
                            onTap: () => _changeColor(4),
                            child: Container(
                              width: 120,
                              height: 31,
                              decoration: BoxDecoration(
                                color: _containerColor4,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Center(
                                child: Text(
                                  'Seni & Kreativitas',
                                  style: TextStyle(
                                    color: _textColor4,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => _changeColor(5),
                            child: Container(
                              width: 120,
                              height: 31,
                              decoration: BoxDecoration(
                                color: _containerColor5,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Center(
                                child: Text(
                                  'Gaya Hidup',
                                  style: TextStyle(
                                    color: _textColor5,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          GestureDetector(
                            onTap: () => _changeColor(6),
                            child: Container(
                              width: 120,
                              height: 31,
                              decoration: BoxDecoration(
                                color: _containerColor6,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Center(
                                child: Text(
                                  'Mental Health',
                                  style: TextStyle(
                                    color: _textColor6,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                GestureDetector(
                  onTap: () {
                    // Logika yang akan dijalankan ketika tombol ditekan
                    print('Tombol ditekan!');
                    // Tambahkan logika atau perintah lain sesuai kebutuhan
                  },
                  child: Container(
                    width: 360,
                    height: 31,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 105, vertical: 1),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFF4518D),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 7.5),
                          child: Text(
                            'Post',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                              height: 0.15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
