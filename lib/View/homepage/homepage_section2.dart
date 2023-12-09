//punya juhar
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:women_center_mobile/Models/artikel_model/artikel_model.dart';
import 'package:women_center_mobile/Models/artikel_model/artikelku_model.dart';
import 'package:women_center_mobile/Models/karir_model/karir_model.dart';
import 'package:women_center_mobile/Models/source/dummy_artikel.dart';
import 'package:women_center_mobile/ViewModel/artikel_view_model/artikel_view_model.dart';

class Home2 extends StatefulWidget {
  const Home2({super.key});

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  ArtikelModel? _artikel;
  final List<KarirModel> listKarir = [];

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
              // return KarirItem(
              //   gambar: model.gambar,
              //   judul: model.judul,
              //   keterangan: model.keterangan,
              // );
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
  final String gambar;
  final String judul;
  final String keterangan;

  const KarirItem(
      {super.key,
      required this.gambar,
      required this.judul,
      required this.keterangan});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //isi halaman saat di tekan gambarnya
      },
      child: Column(
        children: [
          Image.asset(
            gambar,
            height: 130,
          ),
          Text(judul),
          Text(keterangan),
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
