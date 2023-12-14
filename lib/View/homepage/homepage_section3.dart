//punya om David
import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:women_center_mobile/View/bottomnavigationbar/bottom_navigation_bar.dart';
import 'package:women_center_mobile/View/konseling/konseling_page_pilihan_paket.dart';

class Home3 extends StatefulWidget {
  final Function(int index) pindahHalaman;
  const Home3({super.key, required this.pindahHalaman});

  @override
  State<Home3> createState() => _Home3State();
}

class _Home3State extends State<Home3> {
  double _rating = 3.0;
  // int _selectedIndex = 0;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Color(0xFFF2BED1), // Warna card bagian atas
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: const Text(
                          'Rekomendasi Paket',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35),
                        ),
                        child: Image.asset(
                          'Assets/images/home_3.jpg',
                          width: 355,
                          height: 235,
                        ),
                      ),
                      AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.fastOutSlowIn,
                        height: isExpanded
                            ? 300
                            : 0, // Tentukan tinggi teks tambahan
                        color: Color(0xFFF8E8EE),
                        width: 360,
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10),
                                Text('Paket Video Call',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    )),
                                Text('1x Sesi',
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Color(0xFFF4518D),
                                        fontWeight: FontWeight.bold)),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 10),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset('Assets/images/cek_ijo.png',
                                          scale: 4),
                                      SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              'Masa Aktif Paket Selama 2 Minggu')
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 10),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset('Assets/images/cek_ijo.png',
                                          scale: 4),
                                      SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Durasi Konsultasi 1jam/sesi')
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 10),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset('Assets/images/cek_ijo.png',
                                          scale: 4),
                                      SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Privasi di jamin 100% aman')
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 10),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset('Assets/images/cek_ijo.png',
                                          scale: 4),
                                      SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('1 on 1 dengan konselor')
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 10),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset('Assets/images/cek_ijo.png',
                                          scale: 4),
                                      SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Tes Kesehatan Mental')
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 10),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset('Assets/images/cek_ijo.png',
                                          scale: 4),
                                      SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [Text('Tes Kepribadian')],
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 10),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset('Assets/images/cek_ijo.png',
                                          scale: 4),
                                      SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [Text('Tes Minat Karir')],
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 3),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 2, right: 5, top: 25),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 2,
                                        width: 320,
                                        color: Color(0xFFF2BED1),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 75,
                        decoration: BoxDecoration(
                          color: Color(0xFFF8E8EE), // Warna card bagian bawah
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('Rp550.000',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFF4518D))),
                            SizedBox(width: 5),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  widget.pindahHalaman(3);
                                });
                              },
                              child: Text('Pilih Paket',
                                  style: TextStyle(color: Color(0xFFF4518D))),
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromRGBO(250, 181, 207,
                                    0.855), // Warna latar belakang
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      20), // Mengatur sudut tombol
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          color: Color(0xFFF8E8EE), // Warna card bagian bawah
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  isExpanded = !isExpanded;
                                });
                              },
                              icon: Icon(
                                  isExpanded
                                      ? Icons.keyboard_arrow_up
                                      : Icons.keyboard_arrow_down,
                                  color: Color(0xFFF4518D)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20), // Jarak antara card pertama dan card kedua
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                margin: EdgeInsets.all(20),
                color: Color(0xFFF8E8EE),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Rekomendasi Konselor',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      Column(
                        children: [
                          Center(
                            child: CircleAvatar(
                              backgroundImage: AssetImage(
                                  'Assets/images/home_3_profil.jpg'), // Ganti dengan path foto profil konselor
                              radius: 40,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Stanefie Russel, M.Psi., Psikolog',
                              style: TextStyle(
                                fontSize: 16,
                              )),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Profesional Konselor',
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xFF646464))),
                        ],
                      ),
                      SizedBox(height: 45),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // RatingBar.builder(
                              //   initialRating: _rating,
                              //   minRating: 1,
                              //   direction: Axis.horizontal,
                              //   allowHalfRating: true,
                              //   itemCount: 5,
                              //   itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                              //   itemBuilder: (context, _) => Icon(
                              //     Icons.star,
                              //     color: Colors.amber, // Warna bintang yang terisi

                              // //   ),
                              //   unratedColor: Colors.white, // Warna bintang yang tidak terisi
                              //   onRatingUpdate: (rating) {
                              //     setState(() {
                              //       _rating = rating;
                              //     });
                              //   },
                              //   itemSize: 18, // Ukuran bintang
                              // ),
                              SizedBox(
                                  width: 136), // Jarak antara bintang dan tek
                              Container(
                                height:
                                    38, // Sesuaikan dengan tinggi garis yang diinginkan
                                width: 1, // Lebar garis
                                color: Colors.grey, // Warna garis
                                margin: EdgeInsets.symmetric(
                                    horizontal:
                                        29), // Margin antara garis dan teks
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Senin',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Color(0xFF1F1F1F))),
                                      Text('09.00-15.00 WIB',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xFF1F1F1F)))
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          Container(
                            height:
                                25, // Sesuaikan dengan tinggi garis yang diinginkan
                            width: 1, // Lebar garis
                            color: Colors.grey, // Warna garis
                            margin: EdgeInsets.symmetric(
                                horizontal: 45), // Margin antara garis dan teks
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Universitas',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15)),
                                  Text('Indonesia',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15)),
                                  Text('S2 - Psikologi',
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xFF646464))),
                                ],
                              ),
                              Container(
                                height:
                                    62, // Sesuaikan dengan tinggi garis yang diinginkan
                                width: 1, // Lebar garis
                                color: Colors.grey, // Warna garis
                                margin: EdgeInsets.only(
                                    left: 81,
                                    right: 31), // Margin antara garis dan teks
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Rabu',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Color(0xFF1F1F1F))),
                                      Text('09.00-15.00 WIB',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xFF1F1F1F)))
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          Container(
                            height:
                                25, // Sesuaikan dengan tinggi garis yang diinginkan
                            width: 1, // Lebar garis
                            color: Colors.grey, // Warna garis
                            margin: EdgeInsets.symmetric(
                                horizontal: 45), // Margin antara garis dan teks
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('@stefaniersl',
                                  style: TextStyle(fontSize: 15)),
                              Container(
                                height:
                                    53, // Sesuaikan dengan tinggi garis yang diinginkan
                                width: 1, // Lebar garis
                                color: Colors.grey, // Warna garis
                                margin: EdgeInsets.only(
                                    left: 78,
                                    right: 31), // Margin antara garis dan teks
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Jumat',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Color(0xFF1F1F1F))),
                                      Text('09.00-21.00 WIB',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xFF1F1F1F)))
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 150,
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {
                                widget.pindahHalaman(3);
                              },
                              child: Text('Pilih Paket',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14)),
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromRGBO(244, 81, 141, 1)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
