import 'package:flutter/material.dart';
import 'package:women_center_mobile/View/career/career.dart';
import 'package:women_center_mobile/View/profil_page/profil_user.dart';

import '../artikel/artikel_user/artikel_view.dart';
import '../homepage/homepage_view.dart';
import '../konseling/konseling_page_pilihan_paket.dart';
import 'bottom_navigation_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
    HomepageSection(),
    const Artikel(),
    Career(),
    const PilihanPaket(),
    ProfilPage(),
    //kalau halaman sudah siap, setiap nama di ganti ke halaman aslinya
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
      appBar: selectedIndex == 4 ? ProfilPage.getAppBar : appBar,
      body: screens[selectedIndex],
      bottomNavigationBar: MyBottomNavigationBar(
        selectedIndex: selectedIndex,
        onItemTapped: pindahHalaman,
      ),
      // backgroundColor: const Color(0xFFF9F5F6),
      // appBar: AppBar(
      //   title: const Text(
      //     "Konseling",
      //     style: TextStyle(
      //       color: Color(0xFfF1F1F1F),
      //       fontFamily: 'Raleway',
      //       fontWeight: FontWeight.bold,
      //       fontSize: 20,
      //     ),
      //   ),
      //   centerTitle: true,
      //   backgroundColor: const Color(0xFFFDCEDF),
      //   leading: IconButton(
      //     icon: const Icon(Icons.arrow_back),
      //     onPressed: () {
      //       //tombol kembali mengarah ke home
      //       Navigator.of(context).pop();
      //     },
      //   ),
      // ),
    );
  }
}
