import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:women_center_mobile/View/homepage/homepage_section1.dart';
import 'package:women_center_mobile/View/homepage/homepage_section2.dart';
import 'package:women_center_mobile/View/homepage/homepage_section3.dart';
import 'package:women_center_mobile/ViewModel/artikel_view_model/artikel_view_model.dart';
import 'package:women_center_mobile/ViewModel/career_view_model/career_view_model.dart';

class HomepageSection extends StatefulWidget {
  @override
  _HomepageSectionState createState() => _HomepageSectionState();
}

class _HomepageSectionState extends State<HomepageSection> {
  void fetchData() {
    log("Fetching data...");
    context.read<ArtikelViewModel>().fetchLatestArtikel();
    context.read<CareerViewModel>().fetchAllCareer();
  }

  @override
  Widget build(BuildContext context) {
    fetchData();
    return const SafeArea(
      child: SingleChildScrollView(
        child: Column(
          // panggil halaman section disini
          children: [
            //homepage 1
            WidgetHome1(),
            //homepage 2
            Home2(),
            //homepage 3
            Home3(),
          ],
        ),
      ),
    );
  }
}
