//punya juhar
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:women_center_mobile/Models/artikel_model/artikel_model.dart';
import 'package:women_center_mobile/ViewModel/artikel_view_model/artikel_view_model.dart';
import 'package:women_center_mobile/ViewModel/career_view_model/career_view_model.dart';

import '../career/detail_job.dart';

class Home2 extends StatefulWidget {
  final Function(int index) pindahHalaman;
  const Home2({super.key, required this.pindahHalaman});

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  @override
  Widget build(BuildContext context) {
    final listKarir = context.watch<CareerViewModel>().listKarir;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Rekomendasi Karir',
              style: TextStyle(
                fontFamily: 'Raleway',
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            TextButton(
              onPressed: () {
                widget.pindahHalaman(2);
              },
              child: const Text(
                'Selengkapnya',
                style: TextStyle(
                  fontFamily: 'Raleway',
                  color: Color(0xFF646464),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 180,
          child: ListView.builder(
            itemCount: listKarir.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              final model = listKarir[index];
              return KarirItem(
                id: model.id,
                titleJob: model.titleJob,
                logo: model.logo,
                companyName: model.companyName,
              );
            },
          ),
        ),
        LatestArtikel(
          pindahHalaman: widget.pindahHalaman,
        ),
      ],
    );
  }
}

class KarirItem extends StatelessWidget {
  final int id;
  final String titleJob;
  final String logo;
  final String companyName;

  const KarirItem({
    super.key,
    required this.titleJob,
    required this.logo,
    required this.companyName,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: GestureDetector(
        onTap: () {
          //isi halaman saat di tekan gambarnya
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailJob(jobId: id),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.network(
                logo,
                height: 130,
                width: 200,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              titleJob,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFFF4518D),
              ),
            ),
            Text(companyName),
          ],
        ),
      ),
    );
  }
}

class LatestArtikel extends StatefulWidget {
  final Function(int index) pindahHalaman;
  const LatestArtikel({super.key, required this.pindahHalaman});

  @override
  State<LatestArtikel> createState() => _LatestArtikelState();
}

class _LatestArtikelState extends State<LatestArtikel> {
  ArtikelModel? get _artikel => context.watch<ArtikelViewModel>().latestArtikel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Artikel Untukmu',
              style: TextStyle(
                fontFamily: 'Raleway',
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            TextButton(
              onPressed: () {
                widget.pindahHalaman(1);
              },
              child: const Text(
                'Selengkapnya',
                style: TextStyle(
                  fontFamily: 'Raleway',
                  color: Color(0xFF646464),
                ),
              ),
            ),
          ],
        ),
        fromAPI(),
      ],
    );
  }

  Widget fromAPI() {
    if (_artikel == null) return const SizedBox();
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.network(
                _artikel!.thumbnail,
                width: double.infinity, // Atur lebar gambar
                height: 200.0, // Atur tinggi gambar
                fit: BoxFit.fill,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                _artikel!.author.name,
                style: TextStyle(
                  color: Color(0xFF787878),
                  fontFamily: 'Poppins',
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: SizedBox(),
              ),
              Text(
                _artikel!.formatJam(),
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                  color: Color(0xFFA5A5A5),
                ),
              ),
            ],
          ), 
          Row(
           crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  _artikel!.title,
                  softWrap: true,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      fontSize: 25,
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
