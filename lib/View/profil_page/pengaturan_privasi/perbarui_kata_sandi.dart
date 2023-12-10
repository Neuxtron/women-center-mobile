import 'package:flutter/material.dart';
import 'package:women_center_mobile/View/profil_page/pengaturan_privasi/popup_berhasil.dart';

class PerbaruiKataSandi extends StatefulWidget {
  const PerbaruiKataSandi({super.key});

  @override
  State<PerbaruiKataSandi> createState() => _PerbaruiKataSandiState();
}

class _PerbaruiKataSandiState extends State<PerbaruiKataSandi> {
  final _lamaController = TextEditingController();
  final _baruController = TextEditingController();
  final _konfirBaruController = TextEditingController();

  void ubahSandi() {
    // TODO: sambungkan ke API

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          surfaceTintColor: Color(0xFFE5E5E5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: SizedBox(
            width: 328,
            height: 193,
            child: PopupBerhasil(),
          ),
        );
      },
    ).then((value) {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        titleTextStyle: const TextStyle(fontSize: 16, color: Colors.black),
        title: const Text("Pengaturan Privasi"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Perbarui Kata Sandi"),
            SandiItem(
              hintText: "Kata sandi lama",
              controller: _lamaController,
            ),
            SandiItem(
              hintText: "Kata sandi baru",
              controller: _baruController,
            ),
            SandiItem(
              hintText: "Konfirmasi kata sandi baru",
              controller: _konfirBaruController,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: MaterialButton(
                onPressed: ubahSandi,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                color: Color(0xFFF4518D),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                textColor: Colors.white,
                child: Text("Ubah Sandi"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SandiItem extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;

  const SandiItem({
    super.key,
    required this.hintText,
    required this.controller,
  });

  @override
  State<SandiItem> createState() => _SandiItemState();
}

class _SandiItemState extends State<SandiItem> {
  bool _visible = false;

  void toggleVisibiility() {
    setState(() => _visible = !_visible);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: TextField(
        controller: widget.controller,
        obscureText: !_visible,
        style: TextStyle(fontSize: 14),
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(fontWeight: FontWeight.normal),
          isDense: true,
          suffixIcon: IconButton(
            onPressed: toggleVisibiility,
            icon: Icon(_visible ? Icons.visibility : Icons.visibility_off),
            color: Colors.black,
          ),
          enabledBorder: borderSerbaGuna(),
          focusedBorder: borderSerbaGuna(),
          focusedErrorBorder: borderSerbaGuna(),
          errorBorder: borderSerbaGuna(),
        ),
      ),
    );
  }

  InputBorder borderSerbaGuna() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(color: Colors.grey.shade600),
    );
  }
}
