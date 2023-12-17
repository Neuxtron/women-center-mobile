import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:women_center_mobile/Models/artikel_model/artikel_model.dart';
import 'package:women_center_mobile/View/artikel/artikel_user/artikel_widget.dart';

import '../../../ViewModel/artikel_view_model/artikel_view_model.dart';

class Artikel extends StatelessWidget {
  const Artikel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<ArtikelViewModel>().fetchAlllArtikel();

    List<ArtikelModel> artikelList =
        context.watch<ArtikelViewModel>().listArtikel;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        title: Text(
          'Artikel',
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
              color: Colors.black,
              fontSize: 19.5,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        backgroundColor: const Color(0xFFFDCEDF),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              ArtikelWidget(artikelList: artikelList),
            ],
          ),
        ),
      ),
    );
  }
}
