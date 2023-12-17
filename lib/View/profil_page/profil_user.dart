import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

import '../../ViewModel/api_profil_user/profil_user_api_get.dart';
import 'package:women_center_mobile/Models/utils/navigation_service.dart';

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class ProfilPage extends StatefulWidget {
  static PreferredSizeWidget get getAppBar {
    return AppBar(
      backgroundColor: Color(0xFFFDCEDF),
      toolbarHeight: 80,
      leading: Padding(
        padding: const EdgeInsets.only(bottom: 10.0, right: 16.0, left: 4.0),
        child: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(bottom: 10.0, right: 16.0, left: 3.0),
            child: Text(
              'Profil',
              style: GoogleFonts.roboto(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons
              .notifications_none_outlined), // Ganti dengan ikon notifikasi yang diinginkan
          onPressed: () {
            // Aksi yang ingin diambil ketika tombol notifikasi ditekan
          },
        ),
      ],
    );
  }

  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  bool isNotificationEnabled = true;
  Color iconColor = const Color(0xFFF4518D);
  final ApiProfil _apiProfil = ApiProfil();
  Map<String, dynamic> _userProfile = {};

  @override
  void initState() {
    super.initState();
    _fetchUserProfile();
  }

  Future<void> _fetchUserProfile() async {
    try {
      final response = await _apiProfil.getUserProfile();
      print('Profile Picture URL: ${_userProfile['profile_picture']}');
      setState(() {
        _userProfile = response['data'];
      });
    } catch (error) {
      print('Error fetching user profile: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   toolbarHeight: 50,
      //   centerTitle: true,
      //   elevation: 0,
      //   automaticallyImplyLeading: false,
      //   scrolledUnderElevation: 0,
      //   title: Text(
      //     'Artikel',
      //     style: GoogleFonts.roboto(
      //       textStyle: TextStyle(
      //         color: Colors.black,
      //         fontSize: 19.5,
      //         fontWeight: FontWeight.w500,
      //       ),
      //     ),
      //   ),
      //   backgroundColor: const Color(0xFFFDCEDF),
      // ),
      appBar: AppBar(
        backgroundColor: Color(0xFFFDCEDF),
        toolbarHeight: 60,
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        // leading: Padding(
        //   padding: const EdgeInsets.only(bottom: 10.0, right: 16.0, left: 4.0),
        //   child: IconButton(
        //     icon: Icon(Icons.arrow_back),
        //     onPressed: () {},
        //   ),
        // ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(bottom: 10.0, right: 16.0, left: 60.0),
              child: Text(
                'Profil',
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 19.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons
                .notifications_none_outlined), // Ganti dengan ikon notifikasi yang diinginkan
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ClipPath(
              clipper: CustomShapeClipper(),
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.24,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Color(0xFFFDCEDF), Color(0xFFFDCEDF)],
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 0),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                          _userProfile['profile_picture']?.toString() ?? '',
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      _userProfile['full_name'] ?? 'User Name',
                      style: GoogleFonts.roboto(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      _userProfile['email'] ?? 'user@example.com',
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Transform.translate(
                offset: Offset(0.0, -20.0),
                child: Padding(
                  padding: EdgeInsets.only(top: 1),
                  child: Container(
                    margin: EdgeInsets.only(top: 1.0, bottom: 0.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/editprofile');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.pink,
                        onPrimary: Colors.white,
                      ),
                      child: Text('Edit Profil'),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Card(
                  margin: EdgeInsets.only(
                      top: 1.0, bottom: 3.0, right: 16.0, left: 16.0),
                  child: Container(
                    color:
                        Color(0xFFFCFCFC), // Ganti dengan warna yang diinginkan
                    padding:
                        EdgeInsets.symmetric(vertical: 2.0, horizontal: 16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        buildOption(context, Icons.history, 'Riwayat Konseling',
                            '/riwayat', null),
                        buildOption(context, CupertinoIcons.bell, 'Notifikasi',
                            '/notifikasi', null),
                        buildOption(context, CupertinoIcons.checkmark_shield,
                            'Pengaturan Privasi', '/pengaturan', null),
                        buildOption(
                            context, Icons.language, 'Bahasa', '/bahasa', null),
                        buildOption(context, Icons.favorite_outline, 'Favorit',
                            '/favorit', null),
                      ],
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.only(
                      top: 1.0, bottom: 3.0, right: 16.0, left: 16.0),
                  child: Container(
                    color: Color(0xFFFCFCFC),
                    padding: EdgeInsets.only(
                        top: 2.0, bottom: 2.0, right: 16.0, left: 16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        buildOption(context, Icons.feedback_outlined,
                            'Tentang Kami', '/about', null),
                        buildOption(context, Icons.live_help_outlined,
                            'Bantuan dan FAQ', '/bantuan', null),
                        buildOption(context, Icons.headset_mic_outlined,
                            'Layanan Pelanggan', '/chatbots', null),
                      ],
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.only(
                      top: 2.0, bottom: 3.0, right: 16.0, left: 16.0),
                  child: Container(
                    color: Color(0xFFFCFCFC),
                    padding: EdgeInsets.only(
                        top: 2.0, bottom: 2.0, right: 16.0, left: 16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        buildOption(
                            context, Icons.logout_outlined, 'Keluar', null, () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/', (route) => false);
                        }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOption(BuildContext context, IconData icon, String label,
      String? route, Function()? onPressed) {
    return InkWell(
      onTap: () {
        if (route == '/notifikasi') {
          // Tambahkan aksi untuk menangani ketika bagian notifikasi ditekan
          // Anda dapat menampilkan dialog atau halaman pengaturan notifikasi di sini
        } else if (route != null) {
          Navigator.pushNamed(
            NavigationService.navigatorKey.currentContext ?? context,
            route,
          );
        } else if (onPressed != null) {
          onPressed();
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: iconColor,
            ),
            SizedBox(width: 16.0),
            Text(label),
            if (route == '/notifikasi') ...[
              Spacer(),
              Switch(
                value: isNotificationEnabled,
                onChanged: (value) {
                  setState(() {
                    isNotificationEnabled = value;
                  });
                },
                activeTrackColor:
                    Color(0xFFF4518D), // Warna track switch saat aktif
                activeColor: Colors.white, // Warna switch saat aktif
              ),
            ],
          ],
        ),
      ),
    );
  }
}
