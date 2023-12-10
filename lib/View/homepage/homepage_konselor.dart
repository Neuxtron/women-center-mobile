import 'package:flutter/material.dart';
import 'package:women_center_mobile/View/homepage/homepage_section2.dart';

class HomePageKonselor extends StatelessWidget {
  const HomePageKonselor({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            // TODO: Tambahin homepage 1
            LatestArtikel(),
          ],
        ),
      ),
    );
  }
}
