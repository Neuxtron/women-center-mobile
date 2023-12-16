import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:women_center_mobile/Models/utils/auth_service.dart';
import 'package:women_center_mobile/View/widgets/main_page.dart';
import 'package:women_center_mobile/View/homepage/homepage_view.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final List<String> topics = [
    'Hubungan dan keluarga',
    'Seni dan Kreativitas',
    'Gaya Hidup Sehat',
    'Program Kewirausahaan',
    'Berita Wanita',
    'Kesejahteraan Mental',
    'Pertumbuhan Pribadi',
    'Pengembangan Hubungan',
    'Pengembangan Karier',
    'Pengalaman Perjalanan',
    'Teknologi dan Sains',
    'Inspirasi dan Kisah Sukses',
  ];

  Set<String> selectedTopics = Set();

  @override
  Widget build(BuildContext context) {
    final cardWidth = MediaQuery.of(context).size.width / 3;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              'Assets/images/onboarding.png',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            Positioned(
              top: 74,
              left: 300,
              child: TextButton(
                onPressed: () {
                  if (AuthService.role == "user") {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainPage(),
                        ));
                  } else if (AuthService.role == "counselor") {
                    Navigator.pushReplacementNamed(
                        context, '/main_page_konselor');
                  }
                },
                child: Text(
                  'Lanjutkan >>',
                  style: GoogleFonts.raleway(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 160,
              left: 16,
              child: Text(
                'Hallo kak, Sherly Prameswari',
                style: GoogleFonts.raleway(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 6),
            Positioned(
              top: 186,
              left: 16,
              child: Text(
                'Pilih topik favoritmu!!!',
                style: GoogleFonts.raleway(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // SizedBox(height: 5),
            Positioned(
              top: 190,
              left: 16.5,
              right: 16,
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: ListView(
                  children: [
                    Column(
                      children: [
                        for (int i = 0; i < topics.length && i < 6; i += 3)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (int j = i;
                                  j < i + 3 && j < topics.length && j < 6;
                                  j++)
                                _buildSingleCard(topics[j], cardWidth),
                            ],
                          ),
                        for (int i = 6; i < topics.length && i < 12; i += 2)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (int j = i;
                                  j < i + 2 && j < topics.length && j < 12;
                                  j++)
                                _buildSingleCard(topics[j], cardWidth),
                            ],
                          ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 605,
              left: 107,
              child: Text(
                'WOMAN',
                style: GoogleFonts.raleway(
                  fontSize: 48,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFFDCEDF),
                  letterSpacing: 0.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Positioned(
              top: 605,
              left: 101,
              child: Text(
                'WOMAN',
                style: GoogleFonts.raleway(
                  fontSize: 48,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFF4518D),
                  letterSpacing: 0.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Positioned(
              top: 645,
              left: 136,
              child: Text(
                'CENTER',
                style: GoogleFonts.raleway(
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFFDCEDF),
                  letterSpacing: 0.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Positioned(
              top: 645,
              left: 131,
              child: Text(
                'CENTER',
                style: GoogleFonts.raleway(
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFF4518D),
                  letterSpacing: 0.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSingleCard(String topic, double cardWidth) {
    final cardHeight = 55.0;
    final cardMargin = EdgeInsets.only(left: 5, right: 5, bottom: 7);

    final isSelected = selectedTopics.contains(topic);

    final Map<String, double> customWidths = {
      'Hubungan dan keluarga': cardWidth * 1.0,
      'Seni dan Kreativitas': cardWidth * 0.8,
      'Gaya Hidup Sehat': cardWidth * 0.7,
      'Program Kewirausahaan': cardWidth * 1.1,
      'Berita Wanita': cardWidth * 0.5,
      'Kesejahteraan Mental': cardWidth * 0.9,
      'Pertumbuhan Pribadi': cardWidth * 0.8,
      'Pengembangan Hubungan': cardWidth * 1.0,
      'Pengembangan Karier': cardWidth * 0.9,
      'Pengalaman Perjalanan': cardWidth * 0.9,
      'Teknologi dan Sains': cardWidth * 0.85,
      'Inspirasi dan Kisah Sukses': cardWidth * 0.95,
    };

    final customCardWidth =
        customWidths.containsKey(topic) ? customWidths[topic] : cardWidth;

    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            selectedTopics.remove(topic);
          } else {
            selectedTopics.add(topic);
          }
        });
      },
      child: Container(
        width: customCardWidth,
        height: cardHeight,
        margin: cardMargin,
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFFF4518D) : Color(0xFFF8E8EE),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? Color(0xFFF4518D) : Color(0xFFF2BED1),
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            topic,
            style: GoogleFonts.roboto(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: isSelected ? Colors.white : Color(0xFF000000),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
