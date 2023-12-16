import 'package:flutter/material.dart';
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
