import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

import 'package:women_center_mobile/ViewModel/api_profil_konselor/profil_konselor_api.dart';

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class ProfilKonselor extends StatefulWidget {
  @override
  _ProfilKonselorState createState() => _ProfilKonselorState();
}

class _ProfilKonselorState extends State<ProfilKonselor> {
  bool isNotificationEnabled = true;
  Color iconColor = const Color(0xFFF4518D);
  final ApiProfilKonselor _apiProfilKonselor = ApiProfilKonselor();
  Map<String, dynamic> _userProfile = {};

  @override
  void initState() {
    super.initState();
    _fetchUserProfile();
  }

  Future<void> _fetchUserProfile() async {
    try {
      final response = await _apiProfilKonselor.getUserProfile();
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
      appBar: AppBar(
        backgroundColor: Color(0xFFFDCEDF),
        toolbarHeight: 80,
        leading: 
        Padding(
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
          padding: const EdgeInsets.only(bottom: 10.0, right: 16.0, left: 3.0),
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
            icon: Icon(Icons.notifications_none_outlined), // Ganti dengan ikon notifikasi yang diinginkan
            onPressed: () {
            },
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
          onPressed: () {},
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
  margin: EdgeInsets.only(top: 1.0, bottom: 3.0, right: 16.0, left: 16.0),
  child: Container(
    color: Color(0xFFFCFCFC), // Ganti dengan warna yang diinginkan
    padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 16.0),
    child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildOption(context, Icons.history, 'Riwayat User', '/riwayat'),
            buildOption(context, CupertinoIcons.bell, 'Notifikasi', '/notifikasi'),
            buildOption(context, CupertinoIcons.checkmark_shield, 'Pengaturan Privasi', '/pengaturan'),
            buildOption(context, Icons.language, 'Bahasa', '/bahasa'),
          ],
        ),
      ),
    ),
    Card(
      margin: EdgeInsets.only(top: 1.0, bottom: 3.0, right: 16.0, left: 16.0), 
      child: Container(
    color: Color(0xFFFCFCFC),
        padding: EdgeInsets.only(top: 2.0, bottom: 2.0, right: 16.0, left: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildOption(context, Icons.feedback_outlined, 'Tentang Kami', '/tentang'),
            buildOption(context, Icons.live_help_outlined, 'Bantuan dan FAQ', '/bantuan'),
            buildOption(context, Icons.headset_mic_outlined, 'Layanan Pelanggan', '/layanan'),
          ],
        ),
      ),
    ),
  Card(
      margin: EdgeInsets.only(top: 2.0, bottom: 3.0, right: 16.0, left: 16.0), 
      child: Container(
    color: Color(0xFFFCFCFC),
        padding: EdgeInsets.only(top: 2.0, bottom: 2.0, right: 16.0, left: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildOption(context, Icons.logout_outlined, 'Keluar', '/favorit'),
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

  Widget buildOption(BuildContext context, IconData icon, String label, String route) {
  return InkWell(
    onTap: () {
      if (route == '/notifikasi') {
        // Tambahkan aksi untuk menangani ketika bagian notifikasi ditekan
        // Anda dapat menampilkan dialog atau halaman pengaturan notifikasi di sini
      } else {
        Navigator.pushNamed(context, route);
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
  activeTrackColor: Color(0xFFF4518D), // Warna track switch saat aktif
  activeColor: Colors.white, // Warna switch saat aktif
),
          ],
        ],
      ),
    ),
  );
}
}