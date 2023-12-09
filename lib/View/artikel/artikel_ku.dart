import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Models/artikel_model/artikelku_model.dart';

class ArtikelKu extends StatelessWidget {
  const ArtikelKu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ArtikelKuModel> artikelList = [
      ArtikelKuModel(
        "assets/images/artikelku1.png",
        "Manfaat self healing bagi kesehatan mental",
        "800",
        "122",
      ),
      ArtikelKuModel(
        "assets/images/artikelku2.png",
        "Mengenal pentingnya mental health bagi pertumbuhan remaja",
        "800",
        "122",
      ),
      ArtikelKuModel(
        "assets/images/artikelku3.png",
        "Mengapa perempuan lebih banyak menderita gangguan mental",
        "800",
        "122",
      ),
      ArtikelKuModel(
        "assets/images/artikelku4.png",
        "Peran lingkungan dalam mental health",
        "800",
        "122",
      ),
      ArtikelKuModel(
        "assets/images/artikelku5.png",
        "Kesehatan Mental: Pengertian dan cara menjaganya",
        "800",
        "122",
      ),
    ];

    return Scaffold(
       appBar: AppBar(
        backgroundColor: Color(0xFFFDCEDF),
        toolbarHeight: 96,
        leading: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
            },
          ),
        ),
        title: Center(
          child: Transform.translate(
            offset: Offset(0.0, 10.0), // Adjust the value to move the text down
            child: Text('Publish',
            style: GoogleFonts.roboto( // Use the Google Fonts class
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[50],
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Cari artikel",
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color(0xFF979797),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.all(10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: artikelList.length,
                            itemBuilder: (context, index) {
                              return buildArtikelCard(artikelList[index]);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildArtikelCard(ArtikelKuModel artikel) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            artikel.gambar,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  artikel.judul,
                  style: GoogleFonts.raleway(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10), // Adjust the horizontal spacing here
                      child: Row(
                        children: [
                          Icon(
                            Icons.remove_red_eye,
                            color: Color(0xFFB7B7B7),
                          ),
                          SizedBox(width: 5),
                          Text(
                            "${artikel.jumlahpelihat}",
                            style: TextStyle(
                              color: Color(0xFFB7B7B7),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10), // Adjust the horizontal spacing here
                      child: Row(
                        children: [
                          Icon(
                            Icons.chat_bubble_outline,
                            color: Color(0xFFB7B7B7),
                          ),
                          SizedBox(width: 5),
                          Text(
                            "${artikel.jumlahkomentar}",
                            style: TextStyle(
                              color: Color(0xFFB7B7B7),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}