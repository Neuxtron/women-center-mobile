//create artikel konselor widget
import 'package:flutter/material.dart';

//widget serach
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
                decoration: InputDecoration(
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
                style: TextStyle(
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
        // Tambahkan aksi yang ingin dilakukan ketika tombol ditekan di sini
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 105, vertical: 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        primary: Color(0xFFF4518D),
      ),
      child: Text(
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

// Model untuk menyimpan data artikel
class Artikel {
  final String title;
  final String imageUrl;
  final String by;
  final String time;

  Artikel(
      {required this.title,
      required this.imageUrl,
      required this.by,
      required this.time});
}

// Widget ArtikelCard yang menggunakan data dari model
class ArtikelCard extends StatelessWidget {
  final Artikel artikel;

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
                image: AssetImage(artikel.imageUrl),
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
                              TextSpan(
                                text: 'Oleh',
                                style: TextStyle(
                                  color: Color(0xFFA5A5A5),
                                  fontSize: 12,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.w400,
                                  height: 0.14,
                                ),
                              ),
                              TextSpan(
                                text: ' ',
                                style: TextStyle(
                                  color: Color(0xFF787878),
                                  fontSize: 12,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.w400,
                                  height: 0.14,
                                ),
                              ),
                              TextSpan(
                                text: artikel.by,
                                style: TextStyle(
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
                      const SizedBox(width: 115),
                      Expanded(
                        child: SizedBox(
                          child: Text(
                            artikel.time,
                            style: TextStyle(
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
                const SizedBox(height: 12),
                SizedBox(
                  width: 328,
                  child: Text(
                    artikel.title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w700,
                      height: 0,
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

// Widget ArtikelCardScrollable yang menggunakan daftar Artikel
class ArtikelCardScrollable extends StatefulWidget {
  @override
  _ArtikelCardScrollableState createState() => _ArtikelCardScrollableState();
}

class _ArtikelCardScrollableState extends State<ArtikelCardScrollable> {
  // Daftar artikel
  final List<Artikel> articles = [
    Artikel(
      title: 'Tanda Kekerasan Seksual pada Anak: Wajib Dikenali!',
      imageUrl: 'Assets/images/pic_artikel1.png',
      by: 'Dian Safitri',
      time: '2 jam yang lalu',
    ),
    Artikel(
        title: 'Jadi Wanita Karier, Gimana cara hadapi stress',
        imageUrl: 'Assets/images/pic_artikel2.png',
        by: 'Syifa Nur Rahmawati',
        time: '1 hari yang lalu'),
    Artikel(
        title: 'Fakta depresi dimalam hari yang perlu kamu tahu',
        imageUrl: 'Assets/images/pic_artikel3.png',
        by: 'Julia Amalia',
        time: '20 oktober 2023'),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: articles.map((article) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: ArtikelCard(artikel: article),
          );
        }).toList(),
      ),
    );
  }
}

class Kotak extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              BoxShadow(
                color: Color(0x26000000),
                blurRadius: 3,
                offset: Offset(0, 1),
                spreadRadius: 1,
              ),
              BoxShadow(
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
                  decoration: BoxDecoration(
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
                          // Aksi yang ingin dilakukan saat teks diklik
                          print('Teks1 diklik!');
                          // Tambahkan aksi yang diinginkan di sini
                        },
                        child: Text(
                          '15',
                          style: TextStyle(
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
                          // Aksi yang ingin dilakukan saat teks diklik
                          print('Teks diklik!');
                          // Tambahkan aksi yang diinginkan di sini
                        },
                        child: Text(
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
                  decoration: BoxDecoration(
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
                          // Aksi yang ingin dilakukan saat teks diklik
                          print('Teks1 diklik!');
                          // Tambahkan aksi yang diinginkan di sini
                        },
                        child: Text(
                          '5',
                          style: TextStyle(
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
                          // Aksi yang ingin dilakukan saat teks diklik
                          print('Teks diklik!');
                          // Tambahkan aksi yang diinginkan di sini
                        },
                        child: Text(
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
                          // Aksi yang ingin dilakukan saat teks diklik
                          print('Teks1 diklik!');
                          // Tambahkan aksi yang diinginkan di sini
                        },
                        child: Text(
                          '3',
                          style: TextStyle(
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
                          // Aksi yang ingin dilakukan saat teks diklik
                          print('Teks diklik!');
                          // Tambahkan aksi yang diinginkan di sini
                        },
                        child: Text(
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
