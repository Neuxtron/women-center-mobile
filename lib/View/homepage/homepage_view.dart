import 'package:flutter/material.dart';
import 'package:women_center_mobile/View/homepage/homepage_section1.dart';
import 'package:women_center_mobile/View/homepage/homepage_section2.dart';
import 'package:women_center_mobile/View/homepage/homepage_section3.dart';

class HomepageSection extends StatefulWidget {
  const HomepageSection({super.key});

  @override
  State<HomepageSection> createState() => _HomepageSectionState();
}

class _HomepageSectionState extends State<HomepageSection> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SingleChildScrollView(
        child: Column(
          // panggil halaman section disini
          children: [
              //homepage 1
              // HomePage1(),
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