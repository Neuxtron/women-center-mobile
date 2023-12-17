// JUHARMAN YANG MINTA
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:women_center_mobile/View/artikel_2/artikel_2.dart';
import 'package:women_center_mobile/View/edit_profile/edit_form.dart';
import 'package:women_center_mobile/View/edit_profile/profile_edit.dart';
import 'package:women_center_mobile/View/homepage/homepage_view.dart';
import 'package:women_center_mobile/View/kalender/kalender.dart';
import 'package:women_center_mobile/View/artikel/artikel_konselor/hapus_artikel.dart';
import 'package:women_center_mobile/View/chatbot/chatbot_cs_view.dart';
import 'package:women_center_mobile/Models/utils/navigation_service.dart';
import 'package:women_center_mobile/View/booking/booking.dart';
import 'package:women_center_mobile/View/event/event.dart';
import 'package:women_center_mobile/View/tentang_kami/tentang_kami.dart';
import 'package:women_center_mobile/View/widgets/main_page_konselor.dart';
import 'package:women_center_mobile/View/chat_konseling/chat_konseling.dart';
import 'package:provider/provider.dart';
import 'package:women_center_mobile/View/FAQ/bantuan.dart';
import 'package:women_center_mobile/View/artikel/artikel_user/artikel_view.dart';
import 'package:women_center_mobile/View/homepage/notifikasi/homepage_notifikasi.dart';
import 'package:women_center_mobile/View/artikel/artikel_user/artikel_ku.dart';
import 'package:women_center_mobile/View/homepage/notifikasi/homepage_notifikasi_3.dart';
import 'package:women_center_mobile/View/konseling/konseling_view.dart';
import 'package:women_center_mobile/View/metode_pembayaran/metode_pembayaran_1.dart';
import 'package:women_center_mobile/View/metode_pembayaran/metode_pembayaran_2.dart';
import 'package:women_center_mobile/View/metode_pembayaran/pembayaran_widget_tabBar.dart';
import 'package:women_center_mobile/View/login/login_view.dart';
import 'package:women_center_mobile/View/onboarding/onboarding.dart';
// import 'package:women_center_mobile/View/splash_screen/splash_screen.dart';
import 'package:women_center_mobile/ViewModel/artikel_view_model/artikel_view_model.dart';
import 'package:women_center_mobile/View/riwayat/batal.dart';
import 'package:women_center_mobile/View/sesi_konseling/sesi_konseling.dart';
import 'package:women_center_mobile/ViewModel/artikel_view_model/buat_artikel_viewmodel.dart';
import 'package:women_center_mobile/View/profil_page/pengaturan_privasi/pengaturan_privasi.dart';
import 'package:women_center_mobile/View/profil_page/pengaturan_privasi/perbarui_kata_sandi.dart';
import 'package:women_center_mobile/View/profil_page/profil_konselor.dart';
import 'package:women_center_mobile/View/profil_page/profil_user.dart';
import 'package:women_center_mobile/View/riwayat/riwayat_konseling.dart';
import 'package:women_center_mobile/ViewModel/artikel_konselor_model/artikel_konselor_get.dart';
import 'package:women_center_mobile/ViewModel/artikel_view_model/artikel_view_model.dart';
import 'package:women_center_mobile/View/riwayat/batal.dart';
import 'package:women_center_mobile/View/sesi_konseling/sesi_konseling.dart';
import 'package:women_center_mobile/ViewModel/career_viewmodel/career.dart';
import 'package:women_center_mobile/ViewModel/career_viewmodel/detail_career.dart';
import 'package:women_center_mobile/ViewModel/career_viewmodel/filter_carrerr.dart';
import 'package:women_center_mobile/ViewModel/konselor_view_model/konselor_view_model.dart';
import 'package:women_center_mobile/ViewModel/paket_view_model/paket_view_model.dart';
import 'package:women_center_mobile/ViewModel/sesi_konseling_view_mdoel/sesi_konseling.dart';
import 'View/career/detail_job.dart';
import 'View/career/career.dart';
import 'View/login/login_view.dart';
import 'package:women_center_mobile/ViewModel/career_view_model/career_view_model.dart';
import 'package:women_center_mobile/ViewModel/register_view_model/register_view_model.dart';
import 'View/profil_page/favorit/favorit_view.dart';
import 'View/widgets/main_page.dart';
import 'View/konseling/konseling_topik_konseling.dart';
import 'View/register/register.dart';
import 'View/welcome_page/welcome_page.dart';
import 'package:intl/date_symbol_data_local.dart';

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
        ChangeNotifierProvider(create: (context) => RegisterViewModel()),
        ChangeNotifierProvider(create: (context) => ArtikelKonselorProvider()),
        ChangeNotifierProvider(create: (context) => JobViewModel()),
        ChangeNotifierProvider(create: (context) => DetailJobViewModel()),
        ChangeNotifierProvider(create: (context) => FilterJobTypesViewModel()),
        ChangeNotifierProvider(create: (context) => PaketViewModel()),
        ChangeNotifierProvider(create: (context) => KonselorViewModel()),
        ChangeNotifierProvider(create: (context) => CreateArticleViewModel()),
        ChangeNotifierProvider(create: (context) => CounselingSessionViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'women center',
        navigatorKey: NavigationService.navigatorKey,
        theme: ThemeData(
            fontFamily: 'Raleway',
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink)),
        initialRoute: '/',
        routes: {
          // '/': (context) => Home3(),
          '/': (context) => const Welcome(),
          '/login': (context) => const LoginView(),
          '/register': (context) => const Register(),
          '/onboarding': (context) => const Onboarding(),
          '/notifikasi': (context) => const HomepageNotifikasi(),
          '/homepagenotif3': (context) => HomepageNotifikasi3(),
          '/artikelku': (context) => const ArtikelKu(),
          '/artikel': (context) => const Artikel(),
          '/profil_user': (context) => ProfilPage(),
          '/payment': (context) => HomePage(),
          '/pembayaran1': (context) => const MetodePembayaran1(),
          '/editprofile': (context) => ProfileEdit(),
          '/editdataprofile': (context) => EditDataProfile(),
          '/pembayaran2': (context) => const Payment2(),
          '/editprofile': (context) => EditDataProfile(),
          '/chatbots': (context) => ChatScreen(),
          '/topik_konseling': (context) => KonselingTopikKonseling(),
          '/riwayat_konseling': (context) => const RiwayatKonseling(),
          '/booking': (context) => const Booking(),
          '/riwayat_batal': (context) => const RiwayatBatal(),
          '/chat_konseling': (context) => ChatKonseling(),
          '/main_page': (context) => const MainPage(),
          '/main_page_konselor': (context) => const MainPageKonselor(),
          '/pengaturan': (context) => const PengaturanPrivasi(),
          '/perbarui_kata_sandi': (context) => const PerbaruiKataSandi(),
          '/sesi_konseling': (context) => SesiKonseling(),
          '/profil_konselor':(context) => ProfilKonselor(),
          '/hapus_artikel': (context) => ArticleListPage(),
          '/bantuan': (context) => FAQ(),
          '/konselorfav':(context) => FavoritView(),
          '/detail_event': (context) => DetailEvent(),
          '/about': (context) => const TentangKami(),
          '/kalender': (context) => KalenderEvent()
        },
      ),
    );
  }
}
