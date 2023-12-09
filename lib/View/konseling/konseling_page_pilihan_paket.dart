import 'package:flutter/material.dart';
import 'package:women_center_mobile/Models/paket_model/paket.dart';

import 'konseling_pilihan_konselor_1.dart';

class PilihanPaket extends StatefulWidget {
  const PilihanPaket({super.key});

  @override
  State<PilihanPaket> createState() => _PilihanPaketState();
}

class _PilihanPaketState extends State<PilihanPaket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pilih Paket Anda!",
                      style: TextStyle(
                        color: Color(0xFF1F1F1F),
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Kami memiliki paket konsultasi yang sesuai dengan setiap kebutuhan. Mulailah perubahan hari ini.",
                      style: TextStyle(
                        color: Color(0xFF1F1F1F),
                        fontSize: 13,
                      ),
                    ),
                    Paket(
                      model: PaketModel(
                        "Paket Voice Call",
                        3,
                        [
                          "Durasi Konsultasi 1 Jam/Sesi",
                          "1on1 Dengan Konselor",
                          "Privasi Dijamin 100% Aman",
                          "Tes Kesehatan Mental",
                          "Tes Kepribadian",
                          "Tes Minat Karir",
                          "Masa Aktif Paket Selama 1 Minggu",
                        ],
                        350000,
                        250000,
                      ),
                    ),
                    Paket(
                      model: PaketModel(
                        "Paket Video Call",
                        3,
                        [
                          "Durasi Konsultasi 1 Jam/Sesi",
                          "1on1 Dengan Konselor",
                          "Privasi Dijamin 100% Aman",
                          "Tes Kesehatan Mental",
                          "Tes Kepribadian",
                          "Tes Minat Karir",
                          "Masa Aktif Paket Selama 2 Minggu",
                        ],
                        650000,
                        550000,
                      ),
                    ),
                    Paket(
                      model: PaketModel(
                        "Paket All In One",
                        3,
                        [
                          "Durasi Konsultasi 1 Jam/Sesi",
                          "1on1 Dengan Konselor",
                          "Privasi Dijamin 100% Aman",
                          "Tes Kesehatan Mental",
                          "Tes Kepribadian",
                          "Tes Minat Karir",
                          "Masa Aktif Paket Selama 3 Minggu",
                        ],
                        850000,
                        750000,
                      ),
                    ),
                    Paket(
                      model: PaketModel(
                        "Paket Offline",
                        3,
                        [
                          "Ruang Konseling Yang Nyaman & Aman",
                          "Langsung Bertemu Psikolog \n & Konseling Tatap Muka",
                          "Durasi Konsultasi 2 Jam/Sesi",
                          "1on1 Dengan Konselor",
                          "Privasi Dijamin 100% Aman",
                          "Tes Kesehatan Mental",
                          "Tes Kepribadian",
                          "Tes Minat Karir",
                          "Masa Aktif Paket Selama 1 Minggu",
                        ],
                        1050000,
                        950000,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Paket extends StatelessWidget {
  final PaketModel model;

  const Paket({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color(0xFFF4518D)),
          borderRadius: BorderRadius.circular(8)),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            model.judul,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "${model.sesi}x Sesi",
            style: TextStyle(
                color: Color(0xFFF4518D),
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
                fontSize: 15),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: model.daftar.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(top: 15),
                child: Row(
                  children: [
                    Icon(Icons.check_circle, color: Colors.green),
                    SizedBox(width: 11.0),
                    Text(
                      model.daftar[index],
                      style: TextStyle(fontFamily: 'Raleway-medium/Medium 14'),
                    ),
                  ],
                ),
              );
            },
          ),
          Divider(
            indent: 10,
            endIndent: 10,
          ),
          Text(
            "Rp.${model.hargaAsli.toString()}",
            style: TextStyle(
                decoration: TextDecoration.lineThrough,
                color: Color(0xFFC9C9C9),
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Rp.${model.hargaDiskon.toString()}",
                style: TextStyle(
                    color: Color(0xFFF4518D),
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => konseling_pilihan_konselor_1(),
                    ),
                  );
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                color: Color(0xFFF4518D),
                child: Text(
                  "Pilih Paket",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

//apnggil font, textstyle, fontfamily