import 'package:flutter/material.dart';
import 'package:women_center_mobile/View/profil_page/favorit/artikel_favorit.dart';

void main() {
  runApp(ArtikelFavorit());
}

class ArtikelFavorit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFF9F5F6),
          elevation: 0,
          title: const Text('Favorit',
              style: TextStyle(
                color: Color(0xFF0B0B0B),
                fontSize: 16,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w600,
                height: 0,
              )),
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
        body: Center(
            child: Column(
          children: [Choice()],
        )),
      ),
    );
  }
}

class Choice extends StatefulWidget {
  @override
  _ChoiceState createState() => _ChoiceState();
}

class _ChoiceState extends State<Choice> {
  String dropdownValue = 'Semua'; // Nilai default dropdown

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 415,
          color: const Color(0xFFF9F5F6),
          child: DropdownButton<String>(
            dropdownColor: const Color(0xFFF9F5F6),
            value: dropdownValue,
            icon: const Icon(Icons.arrow_drop_down),
            iconSize: 24,
            elevation: 16,
            underline: Container(
              height: 2,
              color: const Color(0xFFF9F5F6),
            ),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue =
                    newValue!; // Mengubah nilai dropdown saat dipilih
              });
            },
            items: <String>['Semua', 'Konselor', 'Artikel', 'Karier']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text(
                    value,
                    style: const TextStyle(
                      color: Color(0xFF371B34),
                      fontSize: 16,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        ContentBasedOnDropdown(
            dropdownValue), // Menampilkan konten berdasarkan nilai dropdown
      ],
    );
  }
}

class ContentBasedOnDropdown extends StatelessWidget {
  final String dropdownValue;

  ContentBasedOnDropdown(this.dropdownValue);

  @override
  Widget build(BuildContext context) {
    if (dropdownValue == 'Artikel') {
      return ArtikelFav();
    } else if (dropdownValue == 'Semua') {
      return Container(
        alignment: Alignment.center,
        child: Text('Konten untuk $dropdownValue belum diimplementasikan'),
      );
    } else if (dropdownValue == 'Konselor') {
      return Container(
        alignment: Alignment.center,
        child: Text('Konten untuk $dropdownValue belum diimplementasikan'),
      );
    } else if (dropdownValue == 'Karier') {
      return Container(
        alignment: Alignment.center,
        child: Text('Konten untuk $dropdownValue belum diimplementasikan'),
      );
    } else {
      return Container(
        alignment: Alignment.center,
        child: Text('Konten untuk $dropdownValue belum diimplementasikan'),
      );
    }
  }
}
