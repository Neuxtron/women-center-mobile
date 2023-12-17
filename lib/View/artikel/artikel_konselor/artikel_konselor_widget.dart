//create artikel konselor widget
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:women_center_mobile/Models/artikel_konselor_model/artikel_konselor_model.dart';
import 'package:women_center_mobile/View/artikel/buat_artikel.dart';
import 'package:women_center_mobile/View/homepage/homepage_section1.dart';
import 'package:women_center_mobile/ViewModel/artikel_konselor_model/artikel_konselor_get.dart';

//widget search
class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 328,
      height: 42,
      padding: const EdgeInsets.all(10),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 14,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 20,
            height: 20,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(),
            child: const Stack(
              children: [
                Icon(
                  Icons.search, // Menambahkan icon search di sini
                  size: 20,
                  color: Color(0xFFA5A5A5),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: TextField(
                controller: _textEditingController,
                decoration: const InputDecoration(
                  hintText: 'Cari artikel',
                  hintStyle: TextStyle(
                    color: Color(0xFFA5A5A5),
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0.15,
                  ),
                  border: InputBorder.none,
                ),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0.15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//widget button buat artikel
class CustomButton extends StatefulWidget {
  const CustomButton({Key? key}) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => buat_artikel()));
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 105, vertical: 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        primary: const Color(0xFFF4518D),
      ),
      child: const Text(
        '+Buat Artikel',
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontFamily: 'Raleway',
          fontWeight: FontWeight.w700,
          height: 0,
        ),
      ),
    );
  }
}

class ArtikelCardScrollable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Menggunakan provider untuk mengakses artikel
    final artikelProvider = Provider.of<ArtikelKonselorProvider>(context);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: artikelProvider.articles.map((article) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: ArtikelCard(
              artikel: article,
            ),
          );
        }).toList(),
      ),
    );
  }
}

// Widget ArtikelCard yang menggunakan data dari model
class ArtikelCard extends StatelessWidget {
  final Article artikel;

  ArtikelCard({required this.artikel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 328,
      height: 280,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 328,
            height: 178,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    artikel.thumbnail), // Menggunakan URL gambar dari artikel
                fit: BoxFit.fill,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 328,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 114.04,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              const TextSpan(
                                text: 'Oleh ',
                                style: TextStyle(
                                  color: Color(0xFFA5A5A5),
                                  fontSize: 12,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.w400,
                                  height: 0.14,
                                ),
                              ),
                              TextSpan(
                                text: artikel.author['name'] ?? '',
                                style: const TextStyle(
                                  color: Color(0xFF787878),
                                  fontSize: 12,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 135),
                      Expanded(
                        child: SizedBox(
                          child: Text(
                            artikel.publishedAt ?? '',
                            style: const TextStyle(
                              color: Color(0xFFA5A5A5),
                              fontSize: 12,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w400,
                              height: 1,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 7),
                SizedBox(
                  width: 328,
                  child: Text(
                    artikel.title ?? '',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w700,
                      height: 1.3,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//widegt kotak progress
class Kotak extends StatelessWidget {
  // final artikelProvider = Provider.of<ArtikelKonselorProvider>(context);

  @override
  Widget build(BuildContext context) {
    //provider artikelkonselor
    final artikelProvider = Provider.of<ArtikelKonselorProvider>(context);

    //inisiasi objek article publish, article review dan article reject
    var publish = artikelProvider.articlePublish;
    var review = artikelProvider.articleReview;
    var reject = artikelProvider.articleReject;
    String ada = '';

    //logika if else untuk nilai null
    if (reject == null) {
      ada = '0';
    }
    if (publish == null) {
      publish = '0';
    } else if (review == null) {
      review = '0';
    }

    return Column(
      children: [
        Container(
          width: 251,
          height: 82,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            shadows: [
              const BoxShadow(
                color: Color(0x26000000),
                blurRadius: 3,
                offset: Offset(0, 1),
                spreadRadius: 1,
              ),
              const BoxShadow(
                color: Color(0x4C000000),
                blurRadius: 2,
                offset: Offset(0, 1),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(
                    top: 25,
                  ), // Tambahkan padding untuk garis batas di sebelah kanan
                  decoration: const BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        color:
                            Colors.black, // Ubah warna garis sesuai keinginan
                        width: 1.5, // Ubah ketebalan garis sesuai keinginan
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => NewPage()),
                          );
                        },
                        child: Text(
                          '$publish',
                          style: const TextStyle(
                            color: Color(0xFFF4518D),
                            fontSize: 32,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            height: 0.02,
                          ),
                        ),
                      ),
                      const SizedBox(height: 9),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => NewPage()),
                          );
                        },
                        child: const Text(
                          'Publish',
                          style: TextStyle(
                            color: Color(0xff34c759),
                            fontSize: 16,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(
                    top: 25,
                  ), // Tambahkan padding untuk garis batas di sebelah kanan
                  decoration: const BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        color:
                            Colors.black, // Ubah warna garis sesuai keinginan
                        width: 1.5, // Ubah ketebalan garis sesuai keinginan
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => NewPage()),
                          );
                        },
                        child: Text(
                          '$review',
                          style: const TextStyle(
                            color: Color(0xFFF4518D),
                            fontSize: 32,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            height: 0.02,
                          ),
                        ),
                      ),
                      const SizedBox(height: 9),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => NewPage()),
                          );
                        },
                        child: const Text(
                          'Proses',
                          style: TextStyle(
                            color: Color(0xfffbd23f),
                            fontSize: 16,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(
                    top: 25,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => NewPage()),
                          );
                        },
                        child: Text(
                          '$ada',
                          style: const TextStyle(
                            color: Color(0xFFF4518D),
                            fontSize: 32,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            height: 0.02,
                          ),
                        ),
                      ),
                      const SizedBox(height: 9),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => NewPage()),
                          );
                        },
                        child: const Text(
                          'Reject',
                          style: TextStyle(
                            color: Color(0xfff30000),
                            fontSize: 16,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
