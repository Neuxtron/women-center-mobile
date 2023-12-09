//punya juhar
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:women_center_mobile/Models/artikel_model/artikel_model.dart';
import 'package:women_center_mobile/Models/artikel_model/artikelku_model.dart';
import 'package:women_center_mobile/Models/karir_model/karir_model.dart';
import 'package:women_center_mobile/Models/source/dummy_artikel.dart';
import 'package:women_center_mobile/ViewModel/artikel_view_model/artikel_view_model.dart';
import 'package:women_center_mobile/ViewModel/career_view_model/career_view_model.dart';

class Home2 extends StatefulWidget {
  const Home2({super.key});

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  ArtikelModel? _artikel;

  void fetchLatestArtikel() async {
    final artikel = await context.read<ArtikelViewModel>().fetchLatestArtikel();
    setState(() => _artikel = artikel);
  }

  void fetchCareers() {
    context.read<CareerViewModel>().fetchAllCareer();
  }

  @override
  void initState() {
    super.initState();
    fetchLatestArtikel();
    fetchCareers();
  }

  @override
  Widget build(BuildContext context) {
    final listKarir = context.watch<CareerViewModel>().listKarir;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Rekomendasi Karir'),
            TextButton(onPressed: () {}, child: Text('Selengkapnya')),
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
                titleJob: model.titleJob,
                logo: model.logo,
                companyName: model.companyName,
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Artikel Untukmu'),
            TextButton(onPressed: () {}, child: Text('Selengkapnya')),
          ],
        ),
        LatestArtikel(artikel: _artikel),
      ],
    );
  }
}

class KarirItem extends StatelessWidget {
  final String titleJob;
  final String logo;
  final String companyName;

  const KarirItem({
    super.key,
    required this.titleJob,
    required this.logo,
    required this.companyName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //isi halaman saat di tekan gambarnya
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

class LatestArtikel extends StatelessWidget {
  final ArtikelModel? artikel;
  const LatestArtikel({super.key, required this.artikel});

  @override
  Widget build(BuildContext context) {
    if (artikel == null) return const SizedBox();
    return Column(
      children: [
        Image.network(artikel!.thumbnail),
        Row(
          children: [
            Text(artikel!.author.name),
            Text(artikel!.formatJam()),
          ],
        ),
        Text(artikel!.title),
      ],
    );
  }
}
