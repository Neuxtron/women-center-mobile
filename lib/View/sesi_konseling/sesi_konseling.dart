import 'package:flutter/material.dart';
import 'package:women_center_mobile/View/bottomnavigationbar/bottom_navigation_bar.dart';

class SesiKonseling extends StatefulWidget {
  @override
  _SesiKonselingState createState() => _SesiKonselingState();
}

class _SesiKonselingState extends State<SesiKonseling> {

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFDCEDF),
        title: Center(
          child: Text(
            "Riwayat Konseling",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Text('Jadwal Terdekat')
                    ],
                  ),
                )
              ],
            ),
            InkWell(
              onTap: () {

              },
              child: Card(
                color: Colors.white,
                margin: EdgeInsets.only(left: 13, right: 13),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Booking id:',
                                    style: TextStyle(
                                        fontSize: 16.0, fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    ' 8912yv12v',
                                    style: TextStyle(
                                        fontSize: 16.0, color: Color(0xFFF4518D)),
                                  ),
                                  SizedBox(width: 130),
                                  Text(
                                    'Hari ini',
                                    style: TextStyle(
                                        fontSize: 16.0, color: Colors.green),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Nama:', 
                                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Aurel Adisti', 
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Paket:', 
                                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 5),
                              Text(
                                'All in One', 
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Senin, 3 Oktober 2023', 
                                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                '09.00 - 10.00', 
                                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Color(0xFFF4518D)),
                              ),
                              SizedBox(width: 138),
                              InkWell(
                                onTap: () {
                                  // Tindakan ketika ikon chat ditekan
                                },
                                child: Icon(Icons.chat_bubble, color: Color(0xFFF4518D), size: 27),
                              ),
                              SizedBox(width: 15),
                              InkWell(
                                onTap: () {
                                  // Tindakan ketika ikon videocam ditekan
                                },
                                child: Icon(Icons.videocam, color: Color(0xFFF4518D), size: 27),
                              ),
                              SizedBox(width: 15),
                              InkWell(
                                onTap: () {
                                  // Tindakan ketika ikon call ditekan
                                },
                                child: Icon(Icons.call, color: Color(0xFFF4518D), size: 27),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {

              },
              child: Card(
                color: Colors.white,
                margin: EdgeInsets.only(left: 13, right: 13, top: 15),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Booking id:',
                                    style: TextStyle(
                                        fontSize: 16.0, fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    ' s124hdgsf3',
                                    style: TextStyle(
                                        fontSize: 16.0, color: Color(0xFFF4518D)),
                                  ),
                                  SizedBox(width: 104),
                                  Text(
                                    '2 hari lagi',
                                    style: TextStyle(
                                        fontSize: 16.0, color: Colors.blue),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Nama:', 
                                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Aurel Adisti', 
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Paket:', 
                                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Video Call', 
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Senin, 12 Oktober 2023', 
                                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                '13.00 - 14.00', 
                                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Color(0xFFF4518D)),
                              ),
                              SizedBox(width: 138),
                              InkWell(
                                onTap: () {
                                  // Tindakan ketika ikon chat ditekan
                                },
                                child: Icon(Icons.chat_bubble, color: Color(0xFFF4518D), size: 27),
                              ),
                              SizedBox(width: 15),
                              InkWell(
                                onTap: () {
                                  // Tindakan ketika ikon videocam ditekan
                                },
                                child: Icon(Icons.videocam, color: Color(0xFFF4518D), size: 27),
                              ),
                              SizedBox(width: 15),
                              InkWell(
                                onTap: () {
                                  // Tindakan ketika ikon call ditekan
                                },
                                child: Icon(Icons.call, color: Color(0xFFF4518D), size: 27),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                
              },
              child: Card(
                color: Colors.white,
                margin: EdgeInsets.only(left: 13, right: 13, top: 15),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Booking id:',
                                    style: TextStyle(
                                        fontSize: 16.0, fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    ' jasd73284',
                                    style: TextStyle(
                                        fontSize: 16.0, color: Color(0xFFF4518D)),
                                  ),
                                  SizedBox(width: 104),
                                  Text(
                                    '10 hari lagi',
                                    style: TextStyle(
                                        fontSize: 16.0, color: Colors.blue),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Nama:', 
                                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Aurel Adisti', 
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Paket:', 
                                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Video Call', 
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Senin, 3 Oktober 2023', 
                                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                '09.00 - 10.00', 
                                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Color(0xFFF4518D)),
                              ),
                              SizedBox(width: 138),
                              InkWell(
                                onTap: () {
                                  // Tindakan ketika ikon chat ditekan
                                },
                                child: Icon(Icons.chat_bubble, color: Color(0xFFF4518D), size: 27),
                              ),
                              SizedBox(width: 15),
                              InkWell(
                                onTap: () {
                                  // Tindakan ketika ikon videocam ditekan
                                },
                                child: Icon(Icons.videocam, color: Color(0xFFF4518D), size: 27),
                              ),
                              SizedBox(width: 15),
                              InkWell(
                                onTap: () {
                                  // Tindakan ketika ikon call ditekan
                                },
                                child: Icon(Icons.call, color: Color(0xFFF4518D), size: 27),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        selectedIndex: _selectedIndex, 
        onItemTapped: (index) {
          setState(() {
            _selectedIndex = index;
          });
        }
      ),
    );
  }
}
