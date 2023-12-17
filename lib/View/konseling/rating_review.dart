//code ui rating dan review
//create by rafi Taufiqurahman

import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void main(List<String> args) {
  runApp(const Review());
}

class Review extends StatefulWidget {
  const Review({super.key});

  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF9F5F6),
      ),
      home: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ImageContainer(),
                  const SizedBox(height: 38),
                  DownloadHasilTes(),
                  const SizedBox(height: 24),
                  Kolom(),
                  const SizedBox(
                    height: 15,
                  ),
                  Button()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ImageContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Container(
              // padding: EdgeInsets.only(top: 200),
              width: 136,
              height: 136,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(10), // Ubah sesuai kebutuhan
                image: const DecorationImage(
                  image: AssetImage(
                      'Assets/images/centang_ijo.png'), // Ganti dengan URL gambar Anda
                  fit: BoxFit.cover, // Sesuaikan dengan kebutuhan
                ),
              ),
            ),
          ),
          const SizedBox(height: 35),
          const Text(
            '''     Terimakasih Telah 
 Melakukan Konseling!''',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
        ],
      ),
    );
  }
}

class DownloadHasilTes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 345,
          height: 44,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x1E000000),
                blurRadius: 6,
                offset: Offset(0, 1),
                spreadRadius: 0,
              )
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Download Hasil Tes',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
              const SizedBox(width: 121),
              GestureDetector(
                onTap: () {
                  // Fungsi yang akan dijalankan saat ikon diklik
                  // Misalnya, tampilkan pesan atau jalankan fungsi download
                  print('Ikon Download diklik!');
                },
                child: Container(
                  width: 24,
                  height: 24,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(),
                  child: const Stack(
                    children: [
                      Positioned.fill(
                        child: Icon(
                          Icons.download_sharp,
                          color: Colors.black,
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

class Kolom extends StatefulWidget {
  @override
  _KolomState createState() => _KolomState();
}

class _KolomState extends State<Kolom> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 345,
          height: 410,
          padding: const EdgeInsets.all(6),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            shadows: const [
              BoxShadow(
                color: Color(0x1E000000),
                blurRadius: 6,
                offset: Offset(0, 1),
                spreadRadius: 0,
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 190,
                padding: const EdgeInsets.only(left: 12, top: 12, right: 12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 42,
                            height: 42,
                            decoration: ShapeDecoration(
                              image: const DecorationImage(
                                image: NetworkImage(
                                    "https://via.placeholder.com/42x42"),
                                fit: BoxFit.fill,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Text(
                            'Stenafie Russel, M.Psi., Psikolog',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF1F1F1F),
                              fontSize: 12,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      height: 50,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 36,
                            child: const Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Rating ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'Raleway',
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                  ),
                                ),
                                SizedBox(height: 6),
                                SizedBox(
                                  width: 302,
                                  child: Text(
                                    ' Berapa tingkat kepuasan anda terhadap konselor?',
                                    style: TextStyle(
                                      color: Color(0xFF939393),
                                      fontSize: 12,
                                      fontFamily: 'Raleway',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Container(
                      width: 300,
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: RatingBar.builder(
                          initialRating: 5,
                          minRating: 1,
                          direction: Axis.horizontal,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 9),
                          itemCount: 5,
                          itemSize: 40,
                          // unratedColor: Colors.red,
                          itemBuilder: (context, index) {
                            return Icon(
                              index < 5
                                  ? Icons.star
                                  : Icons
                                      .star_border, // Menentukan apakah bintang dipilih atau tidak
                              color: index < 5
                                  ? Color(0xFFFCD509)
                                  : Colors
                                      .grey, // Warna bintang dipilih dan tidak dipilih
                              size: 40,
                            );
                          },
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 208,
                padding: const EdgeInsets.only(left: 12, right: 12, top: 2),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 50,
                      child: const Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Komentar',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                          SizedBox(height: 6),
                          SizedBox(
                            width: 303,
                            child: Text(
                              'Beri saran dan masukan untuk konselor agar semakin baik kedepanya!',
                              style: TextStyle(
                                color: Color(0xFF939393),
                                fontSize: 12,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      width: 303,
                      height: 122,
                      // padding: const EdgeInsets.symmetric(
                      //     horizontal: 16, vertical: 10),
                      padding: const EdgeInsets.only(left: 10),
                      decoration: ShapeDecoration(
                        color: const Color(0xFFF5F5F5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            maxLines: 5, // Menentukan jumlah baris maksimum
                            decoration: InputDecoration(
                              hintText: 'Isi komentar anda disini...',
                              hintStyle: TextStyle(
                                color: Color(0xFF939393),
                                fontSize: 12,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w400,
                                height: 0.14,
                              ),
                              border: InputBorder.none,
                            ),
                            style: TextStyle(
                              // Gaya teks ketika mengisi TextField
                              color: Colors.black, // Warna teks saat diisi
                              fontSize: 12, // Ukuran teks
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w600,
                              height: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showSuccessMessage(context);
      },
      child: Container(
        width: 345,
        height: 40,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: const Color(0xFFF4518D),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: const Center(
          child: Text(
            'Kirim Review',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
              height: 1.0,
              letterSpacing: 0.10,
            ),
          ),
        ),
      ),
    );
  }

  void _showSuccessMessage(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Container(
            width: 272,
            height: 104,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Text(
                'Berhasil Memberikan Rating & Review',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF1E1E1E),
                  fontSize: 16,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w700,
                  height: 1.0,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}



//  Container(
//                             width: 302,
//                             // height: 50,
//                             // padding: const EdgeInsets.symmetric(horizontal: 16),
//                             decoration: ShapeDecoration(
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(8)),
//                             ),
//                             child: Row(
//                               mainAxisSize: MainAxisSize.min,
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 RatingBar.builder(
//                                   itemBuilder: (context, _) => Icon(
//                                     Icons.star,
//                                     color: Colors.amber,
//                                   ),
//                                   onRatingUpdate: (rating) {
//                                     print(rating);
//                                   },
//                                 )
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),