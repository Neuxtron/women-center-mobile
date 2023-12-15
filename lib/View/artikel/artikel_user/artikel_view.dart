import 'package:flutter/material.dart';
import 'package:women_center_mobile/Models/artikel_model/artikel_model.dart';
import 'package:women_center_mobile/Models/source/dummy_artikel.dart';
import 'package:women_center_mobile/View/artikel/artikel_user/artikel_widget.dart';

class Artikel extends StatelessWidget {
  const Artikel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ArtikelModel> artikelList = [
      DummyArtikel.artikelUntukmu,
      DummyArtikel.artikelUntukmu,
      // Add more ArtikelModel objects as needed
    ];
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            ArtikelWidget(artikelList: artikelList),
          ],
        ),
      ),
    );
  }
}
