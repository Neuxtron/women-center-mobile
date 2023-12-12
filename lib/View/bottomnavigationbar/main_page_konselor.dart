import 'package:flutter/material.dart';
import 'package:women_center_mobile/View/homepage/homepage_konselor.dart';

import 'bottom_navigation_bar.dart';

class MainPageKonselor extends StatefulWidget {
  const MainPageKonselor({super.key});

  @override
  State<MainPageKonselor> createState() => _MainPageKonselorState();
}

class _MainPageKonselorState extends State<MainPageKonselor> {
  int selectedIndex = 0;
  String? appbarTitle = null;

  PreferredSizeWidget? get appBar {
    if (appbarTitle == null) return null;
    return AppBar(
      backgroundColor: Colors.pink[100],
      title: Center(child: Text(appbarTitle ?? "")),
      automaticallyImplyLeading: false,
    );
  }

  final List screens = [
    HomepageSectionKonselor(),
    Center(
      child: Text("Artikel"),
    ),
    Center(
      child: Text("Karir"),
    ),
    Center(
      child: Text("Konseling"),
    ),
    Center(
      child: Text("Profil"),
    ),
  ];

  List<String?> listAppBarTitle = [
    null,
    "Artikel",
    "Karir",
    "Konseling",
    "Profil"
  ];

  void pindahHalaman(index) {
    setState(() {
      selectedIndex = index;
      appbarTitle = listAppBarTitle[selectedIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: screens[selectedIndex],
      bottomNavigationBar: MyBottomNavigationBar(
        selectedIndex: selectedIndex,
        onItemTapped: pindahHalaman,
      ),
    );
  }
}
