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
            const Text('Rekomendasi Karir'),
            TextButton(
              onPressed: () {
                widget.pindahHalaman(2);
              },
              child: const Text('Selengkapnya'),
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
    return GestureDetector(
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
        children: [
          Image.network(
            logo,
            height: 130,
          ),
          Text(titleJob),
          Text(companyName),
        ],
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
            const Text('Artikel Untukmu'),
            TextButton(
              onPressed: () {
                widget.pindahHalaman(1);
              },
              child: const Text('Selengkapnya'),
            ),
          ],
        ),
        fromAPI(),
      ],
    );
  }

  Widget fromAPI() {
    if (_artikel == null) return const SizedBox();
    return Column(
      children: [
        Image.network(_artikel!.thumbnail),
        Row(
          children: [
            Text(_artikel!.author.name),
            Text(_artikel!.formatJam()),
          ],
        ),
        Text(_artikel!.title),
      ],
    );
  }
}
