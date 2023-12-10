import 'package:flutter/material.dart';

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
        titleTextStyle: TextStyle(fontSize: 16, color: Colors.black),
        title: Text("Pengaturan Privasi"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                surfaceTintColor: MaterialStatePropertyAll(Colors.white),
                foregroundColor: MaterialStatePropertyAll(Colors.black),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                shadowColor: MaterialStatePropertyAll(
                  Color(0xFF212121).withOpacity(.1),
                ),
                elevation: MaterialStatePropertyAll(20),
              ),
              child: Row(
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
    if (states.contains(MaterialState.selected)) return Color(0xFFF4518D);
    return null;
  });

  void onChanged(value) {
    setState(() => _enabled = !_enabled);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.pengaturan["title"],
        style: TextStyle(fontSize: 14),
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
