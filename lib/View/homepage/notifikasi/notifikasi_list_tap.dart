import 'package:flutter/material.dart';
import 'homepage_notifikasi_widget.dart'; // Import file NotifikasiList

class NotifikasiListTap extends StatefulWidget {
  const NotifikasiListTap({Key? key});

  @override
  State<NotifikasiListTap> createState() => _NotifikasiListTapState();
}

class _NotifikasiListTapState extends State<NotifikasiListTap> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.article),
              title: const Text('Artikel'),
              subtitle: const Text('Ini adalah artikel'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotifikasiList()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.work),
              title: const Text('Karir'),
              subtitle: const Text('Info karir dan pekerjaan'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotifikasiList()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.chat),
              title: const Text('Konseling'),
              subtitle: const Text('Bantuan konseling'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotifikasiList()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
