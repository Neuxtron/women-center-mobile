//punya juhar
import 'package:flutter/material.dart';
import 'package:women_center_mobile/Models/artikel_model/artikel_model.dart';
import 'package:women_center_mobile/Models/karir_model/karir_model.dart';
import 'package:women_center_mobile/Models/source/dummy_artikel.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class Home2 extends StatefulWidget {
  const Home2({super.key});

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  List<KarirModel> listKarir = [
    KarirModel(
      id: 0,
      gambar: "Assets/images/home_3.jpg",
      judul: "judul",
      keterangan: "keterangan",
    ),
    KarirModel(
      id: 0,
      gambar: "Assets/images/home_3.jpg",
      judul: "judul",
      keterangan: "keterangan",
    ),
    KarirModel(
      id: 0,
      gambar: "Assets/images/home_3.jpg",
      judul: "judul",
      keterangan: "keterangan",
    ),
  ];

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
              return KarirItem(
                gambar: model.gambar,
                judul: model.judul,
                keterangan: model.keterangan,
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
        Image.network(DummyArtikel.artikelUntukmu.thumbnail),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(DummyArtikel.artikelUntukmu.author.name),
            Text(DummyArtikel.artikelUntukmu.formatJam()),
          ],
        ),
        Text(DummyArtikel.artikelUntukmu.title),
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

//jika gambar dari API 
