// JUHARMAN YANG MINTA
import 'package:flutter/material.dart';
import 'package:women_center_mobile/View/booking/booking.dart';
import 'package:women_center_mobile/View/chat_konseling/chat_konseling.dart';
import 'package:women_center_mobile/View/edit_profile/edit_profile.dart';
import 'package:provider/provider.dart';
import 'package:women_center_mobile/View/artikel_2/artikel_2.dart';
import 'package:women_center_mobile/View/homepage/homepage_view.dart';
import 'package:women_center_mobile/View/FAQ/bantuan.dart';
import 'package:women_center_mobile/View/konseling/konseling_pilihan_konselor_2.dart';
import 'package:women_center_mobile/View/artikel/artikel_view.dart';
import 'package:women_center_mobile/View/homepage/notifikasi/homepage_notifikasi.dart';
import 'package:women_center_mobile/View/artikel/artikel_ku.dart';
import 'package:women_center_mobile/View/homepage/notifikasi/homepage_notifikasi_3.dart';
import 'package:women_center_mobile/View/metode_pembayaran/metode_pembayaran_1.dart';
import 'package:women_center_mobile/View/metode_pembayaran/metode_pembayaran_2.dart';
import 'package:women_center_mobile/View/metode_pembayaran/pembayaran_widget_tabBar.dart';
import 'package:women_center_mobile/View/login/login_view.dart';
import 'package:women_center_mobile/View/onboarding/onboarding.dart';
import 'package:women_center_mobile/View/profil_page/profil_user.dart';
import 'package:women_center_mobile/View/riwayat/riwayat_konseling.dart';
import 'package:women_center_mobile/ViewModel/artikel_view_model/artikel_view_model.dart';
import 'package:women_center_mobile/View/riwayat/batal.dart';
import 'package:women_center_mobile/View/sesi_konseling/sesi_konseling.dart';
import 'package:women_center_mobile/ViewModel/career_view_model/career_view_model.dart';
import 'View/bottomnavigationbar/main_page.dart';
import 'View/career/detail_job.dart';
import 'View/career/career.dart';
import 'View/konseling/konseling_topik_konseling.dart';
import 'View/login/login_view.dart';
import 'View/register/register.dart';
import 'package:google_fonts/google_fonts.dart';
import 'View/welcome_page/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ArtikelViewModel()),
        ChangeNotifierProvider(create: (context) => CareerViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'women center',
        theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink)),
        initialRoute: '/chat_konseling',
        routes: {
          '/': (context) => const Welcome(),
          '/login': (context) => const LoginView(),
          '/register': (context) => const Register(),
          '/onboarding': (context) => const Onboarding(),
          '/notifikasi': (context) => const HomepageNotifikasi(),
          '/homepageview': (context) => const HomepageSection(),
          '/homepagenotif3': (context) => HomepageNotifikasi3(),
          '/artikelku': (context) => const ArtikelKu(),
          '/artikel': (context) => const Artikel(),
          '/profil_user': (context) => ProfilPage(),
          '/payment': (context) => HomePage(),
          '/pembayaran1': (context) => const MetodePembayaran1(),
          '/editprofile': (context) => EditProfile(),
          '/topik_konseling': (context) => KonselingTopikKonseling(),
          '/riwayat_konseling': (context) => const RiwayatKonseling(),
          '/booking': (context) => const Booking(),
          '/riwayat_batal': (context) => const RiwayatBatal(),
          '/chat_konseling': (context) => const ChatKonseling(),
        },
      ),
    );
  }
}
