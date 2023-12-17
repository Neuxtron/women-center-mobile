import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:women_center_mobile/View/edit_profile/edit_form.dart';
import 'package:women_center_mobile/ViewModel/profie_edit/profile_edit.dart';
import 'dart:ui';

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

class ProfileEdit extends StatefulWidget {
  @override
  _ProfileEditState createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
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
        print('userprofile $_userProfile');
      });
    } catch (error) {
      print('Error fetching user profile: $error');
    }
  }

  // Future<void> _navigateToEditProfile() async {
  //   var updatedData = await Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => EditDataProfile(),
  //     ),
  //   );

  //   // Print updatedData for debugging

  //   if (updatedData != null) {
  //     _fetchUserProfile();
  //     // setState(() {
  //     //   _userProfile = updatedData;
  //     // });
  //     print('Received Updated Data: $updatedData');
  //   } else {
  //     print('No updated data received.');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFDCEDF),
        toolbarHeight: 80,
        leading: Padding(
          padding: const EdgeInsets.only(bottom: 10.0, right: 16.0, left: 4.0),
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
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
                'Edit Profil',
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
            icon: Icon(Icons.ios_share_outlined),
            onPressed: () {
              // Aksi yang ingin diambil ketika tombol notifikasi ditekan
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                    Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 0),
                          child: ClipOval(
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage(
                                _userProfile['profile_picture']?.toString() ??
                                    '',
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 5,
                          right: 5,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditDataProfile(),
                                ),
                              );
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(
                                    0xFFFDCEDF), // Ganti dengan warna yang diinginkan
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                  size:
                                      16, // Ganti dengan ukuran ikon yang diinginkan
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(_userProfile['full_name'] ?? 'User Name'),
                    Text(_userProfile['email'] ?? 'exam@ple.com'),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              padding:
                  EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //-------------------- USERNAME--------------------
                      Text(
                        'Username:',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        padding: EdgeInsets.all(10.0),
                        width: 357,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.pink),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        child: Text(
                          _userProfile['username'] ?? 'username',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      //--------------------FULL NAME------------------
                      SizedBox(height: 15),
                      Text(
                        'Full Name:',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        padding: EdgeInsets.all(10.0),
                        width: 357,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.pink),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        child: Text(
                          _userProfile['full_name'] ?? 'full name',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      //--------------------EMAIL----------------
                      SizedBox(height: 15),
                      Text(
                        'Email:',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        padding: EdgeInsets.all(10.0),
                        width: 357,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.pink),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        child: Text(
                          _userProfile['email'] ?? 'examp@le.com',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      //-------------BIRTHDAY----------
                      SizedBox(height: 15),
                      Text(
                        'Birthday:',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        padding: EdgeInsets.all(10.0),
                        width: 357,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.pink),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        child: Text(
                          _userProfile['birthday'] ?? 'dd/mm/yy',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
