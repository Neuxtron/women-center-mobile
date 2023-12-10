import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:women_center_mobile/Models/utils/navigation_service.dart';

class PengaturanPrivasi extends StatelessWidget {
  const PengaturanPrivasi({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> listPengaturan = [
      {
        "title": "Izinkan aplikasi akses galeri",
        "key": "IZIN_GALERI",
      },
      {
        "title": "Izinkan notifikasi",
        "key": "IZIN_NOTIFIKASI",
      },
      {
        "title": "Izinkan lokasi anda",
        "key": "IZIN_LOKASI",
      },
      {
        "title": "Izinkan kamera",
        "key": "IZIN_KAMERA",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        titleTextStyle: const TextStyle(fontSize: 16, color: Colors.black),
        title: const Text("Pengaturan Privasi"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  NavigationService.navigatorKey.currentContext ?? context,
                  "/perbarui_kata_sandi",
                );
              },
              style: ButtonStyle(
                surfaceTintColor: const MaterialStatePropertyAll(Colors.white),
                foregroundColor: const MaterialStatePropertyAll(Colors.black),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                shadowColor: MaterialStatePropertyAll(
                  const Color(0xFF212121).withOpacity(.1),
                ),
                elevation: const MaterialStatePropertyAll(20),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Perbarui Kata Sandi",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.keyboard_arrow_right_rounded),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: listPengaturan.length,
              itemBuilder: (context, index) {
                return PengaturanItem(
                  pengaturan: listPengaturan[index],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class PengaturanItem extends StatefulWidget {
  final Map<String, dynamic> pengaturan;
  const PengaturanItem({super.key, required this.pengaturan});

  @override
  State<PengaturanItem> createState() => _PengaturanItemState();
}

class _PengaturanItemState extends State<PengaturanItem> {
  bool _enabled = true;
  final _trackColor = MaterialStateProperty.resolveWith((states) {
    if (states.contains(MaterialState.selected)) return const Color(0xFFF4518D);
    return null;
  });

  void onChanged(value) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() => _enabled = !_enabled);
    prefs.setBool(widget.pengaturan["key"], _enabled);
  }

  void readSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _enabled = prefs.getBool(widget.pengaturan["key"]) ?? true;
    });
  }

  @override
  void initState() {
    super.initState();
    readSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.pengaturan["title"],
        style: const TextStyle(fontSize: 14),
      ),
      trailing: SizedBox(
        height: 24,
        width: 48,
        child: Switch(
          value: _enabled,
          trackColor: _trackColor,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
