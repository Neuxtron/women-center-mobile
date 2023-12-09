import 'package:flutter/material.dart';

class buat_artikel extends StatefulWidget {
  @override
  _buat_artikelState createState() => _buat_artikelState();
}

class _buat_artikelState extends State<buat_artikel> {
  TextEditingController _judulController = TextEditingController();
  TextEditingController _isiController = TextEditingController();
  Color _warna1 = Colors.white;
  Color _textColor1 = Colors.black;
  Color _warna2 = Colors.white;
  Color _textColor2 = Colors.black;
  Color _warna3 = Colors.white;
  Color _textColor3 = Colors.black;
  Color _warna4 = Colors.white;
  Color _textColor4 = Colors.black;
  Color _warna5 = Colors.white;
  Color _textColor5 = Colors.black;
  Color _warna6 = Colors.white;
  Color _textColor6 = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[100],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: Center(
          child: Text(
            "Buat Artikel",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Judul Artikel',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 2),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.7),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3)
                    )
                  ]
                ),
                child: TextFormField(
                  controller: _judulController,
                  decoration: InputDecoration(
                    hintText: 'Ketik Judul artikel disini...',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Upload Foto',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 2),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.7),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3)
                    )
                  ]
                ),
                child: TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: 'Upload foto disini...',
                    suffixIcon: InkWell(
                      onTap: () {
                        
                      },
                      child: Icon(
                        Icons.upload_file,
                        color: Color(0xFF979797),
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Isi Artikel',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 2),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.7),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3)
                    )
                  ]
                ),
                child: TextFormField(
                  controller: _isiController,
                  decoration: InputDecoration(
                    hintText: 'Ketik Artikel Anda disini...',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 115),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Katgori', style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),)
                ],
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _warna1 = (_warna1 == Colors.white) ? const Color.fromRGBO(244, 81, 141, 1) : Colors.white;
                        _textColor1 = (_textColor1 == Colors.black) ? Colors.white : Colors.black; 
                      });
                    }, 
                    child: Text('Berita Wanita', style: TextStyle(color: _textColor1, fontSize: 14)),
                    style: ElevatedButton.styleFrom(primary: _warna1),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _warna2 = (_warna2 == Colors.white) ? const Color.fromRGBO(244, 81, 141, 1) : Colors.white;
                        _textColor2 = (_textColor2 == Colors.black) ? Colors.white : Colors.black; 
                      });
                    }, 
                    child: Text('Teknologi', style: TextStyle(color: _textColor2, fontSize: 14)),
                    style: ElevatedButton.styleFrom(primary: _warna2),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _warna3 = (_warna3 == Colors.white) ? const Color.fromRGBO(244, 81, 141, 1) : Colors.white;
                        _textColor3 = (_textColor3 == Colors.black) ? Colors.white : Colors.black; 
                      });
                    }, 
                    child: Text('Karier', style: TextStyle(color: _textColor3, fontSize: 14)),
                    style: ElevatedButton.styleFrom(primary: _warna3),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _warna4 = (_warna4 == Colors.white) ? const Color.fromRGBO(244, 81, 141, 1) : Colors.white;
                        _textColor4 = (_textColor4 == Colors.black) ? Colors.white : Colors.black; 
                      });
                    }, 
                    child: Text('Seni & Kreatifitas', style: TextStyle(color: _textColor4, fontSize: 14)),
                    style: ElevatedButton.styleFrom(primary: _warna4),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _warna5 = (_warna5 == Colors.white) ? const Color.fromRGBO(244, 81, 141, 1) : Colors.white;
                        _textColor5 = (_textColor5 == Colors.black) ? Colors.white : Colors.black; 
                      });
                    }, 
                    child: Text('Gaya hidup', style: TextStyle(color: _textColor5, fontSize: 14)),
                    style: ElevatedButton.styleFrom(primary: _warna5),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _warna6 = (_warna6 == Colors.white) ? const Color.fromRGBO(244, 81, 141, 1) : Colors.white;
                        _textColor6 = (_textColor6 == Colors.black) ? Colors.white : Colors.black; 
                      });
                    }, 
                    child: Text('Mental Health', style: TextStyle(color: _textColor6, fontSize: 14)),
                    style: ElevatedButton.styleFrom(primary: _warna6),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max, // Lebar maksimum
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        // Tindakan yang diambil saat tombol ditekan
                      });
                    },
                    child: Text('Pilih Paket', style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(244, 81, 141, 1), // Warna latar belakang
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // Mengatur sudut tombol
                      ),
                      minimumSize: Size(double.infinity, 40), // Lebar maksimum dan tinggi tombol
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}