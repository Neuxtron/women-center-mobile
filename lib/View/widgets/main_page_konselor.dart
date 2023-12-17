import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:women_center_mobile/View/artikel/artikel_konselor/artikel_konselor_view.dart';
import 'package:women_center_mobile/View/widgets/bottom_navigation_bar_konselor.dart';
import 'package:women_center_mobile/View/homepage/homepage_konselor.dart';
import 'package:women_center_mobile/ViewModel/artikel_view_model/artikel_view_model.dart';

import '../profil_page/profil_konselor.dart';
import '../sesi_konseling/sesi_konseling.dart';
import 'bottom_navigation_bar_konselor.dart';

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

  List get screens => [
        HomepageSectionKonselor(
          pindahHalaman: pindahHalaman,
        ), // 0
        const artikelKonselor(), // 1
        SesiKonseling(), // 2
        ProfilKonselor(), // 3
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
      // appBar: appBar,
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationKonselor(
        selectedIndex: selectedIndex,
        onItemTapped: pindahHalaman,
      ),
    );
  }
}
