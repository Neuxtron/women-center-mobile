//punya juhar
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:women_center_mobile/Models/artikel_model/artikel_model.dart';
import 'package:women_center_mobile/ViewModel/artikel_view_model/artikel_view_model.dart';
import 'package:women_center_mobile/ViewModel/career_view_model/career_view_model.dart';

class Home2 extends StatefulWidget {
  const Home2({super.key});

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  void fetchCareers() {
    context.read<CareerViewModel>().fetchAllCareer();
  }

  @override
  void initState() {
    super.initState();
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
            const Text('Rekomendasi Karir'),
            TextButton(onPressed: () {}, child: const Text('Selengkapnya')),
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
        const LatestArtikel(),
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

class LatestArtikel extends StatefulWidget {
  const LatestArtikel({super.key});

  @override
  State<LatestArtikel> createState() => _LatestArtikelState();
}

class _LatestArtikelState extends State<LatestArtikel> {
  ArtikelModel? _artikel;

  void fetchLatestArtikel() async {
    final artikel = await context.read<ArtikelViewModel>().fetchLatestArtikel();
    setState(() => _artikel = artikel);
  }

  @override
  void initState() {
    super.initState();
    fetchLatestArtikel();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Artikel Untukmu'),
            TextButton(onPressed: () {}, child: const Text('Selengkapnya')),
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
