import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:women_center_mobile/View/bottomnavigationbar/bottom_navigation_bar_konselor.dart';
import 'package:women_center_mobile/View/homepage/homepage_konselor.dart';
import 'package:women_center_mobile/ViewModel/artikel_view_model/artikel_view_model.dart';

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
      child: Text("Konseling"),
    ),
    Center(
      child: Text("Profil"),
    ),
  ];

  List<String?> listAppBarTitle = [null, "Artikel", "Konseling", "Profil"];

  void pindahHalaman(index) {
    setState(() {
      selectedIndex = index;
      appbarTitle = listAppBarTitle[selectedIndex];
    });
  }

  void fetchData() {
    context.read<ArtikelViewModel>().fetchLatestArtikel();
  }

  @override
  Widget build(BuildContext context) {
    fetchData();
    return Scaffold(
      appBar: appBar,
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationKonselor(
        selectedIndex: selectedIndex,
        onItemTapped: pindahHalaman,
      ),
    );
  }
}
