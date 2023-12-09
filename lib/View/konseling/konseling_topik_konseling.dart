import 'package:flutter/material.dart';

class KonselingTopikKonseling extends StatefulWidget {
  @override
  _KonselingTopikKonselingState createState() =>
      _KonselingTopikKonselingState();
}

class _KonselingTopikKonselingState extends State<KonselingTopikKonseling> {
  List<String> selectedTopics = [];
  List<String> konselingTopics = [
    'Trauma',
    'Depresi',
    'Kekerasan Fisik/Seksual',
    'Hubungan',
    'Karir',
    'Phobia',
    'Pernikahan',
    'Keluarga',
    'Anak & Remaja',
    'Gangguan Kepribadian',
    'Perilaku',
    'Perkembangan Diri',
    'Masalah Diri',
    'Kecemasan',
    'Konflik Keluarga',
    // Tambahkan topik konseling lainnya di sini
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            'Pilihan Topik',
            style: TextStyle(
              fontSize: 11.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: konselingTopics.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: selectedTopics.contains(konselingTopics[index]),
                        onChanged: (bool? value) {
                          setState(() {
                            if (value != null) {
                              if (value) {
                                selectedTopics.add(konselingTopics[index]);
                              } else {
                                selectedTopics.remove(konselingTopics[index]);
                              }
                            }
                          });
                        },
                      ),
                      Text(konselingTopics[index]),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
