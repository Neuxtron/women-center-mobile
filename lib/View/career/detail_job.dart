import 'package:flutter/material.dart';

import '../widgets/bottom_navigation_bar.dart';

class DetailJob extends StatefulWidget {
  @override
  _DetailJobState createState() => _DetailJobState();
}

class _DetailJobState extends State<DetailJob> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[100],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: Center(
          child: Text(
            "Detail Karir",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Color(0xFFF8E8EE),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      child: Image.asset(
                        'Assets/images/detail-karir1.png',
                        width: 1025,
                        height: 75,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'Assets/images/career1.png',
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 15.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Engineer - Jakarta',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'PT OS SELNAJAYA INDONESIA',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 15),
                          Image.asset('Assets/images/briefcase.png', scale: 3),
                          SizedBox(width: 10),
                          Text(
                            'On site | Full time | Entry level', // Ganti dengan teks yang diinginkan
                            style: TextStyle(
                                fontSize: 16.0, color: Color(0xFFF646464)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 15),
                          Image.asset(
                              'Assets/images/building.columns.circle.png',
                              scale: 3),
                          SizedBox(width: 10),
                          Text(
                            '501 - 1000 employees | Human Resources', // Ganti dengan teks yang diinginkan
                            style: TextStyle(
                                fontSize: 15.0, color: Color(0xFFF646464)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 15),
                          Image.asset('Assets/images/checklist.png', scale: 3),
                          SizedBox(width: 10),
                          Text(
                            'Skils : Cascading Style Sheets (CSS)', // Ganti dengan teks yang diinginkan
                            style: TextStyle(
                                fontSize: 16.0, color: Color(0xFFF646464)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 3),
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  // Handle button tap
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Color(
                                      0xFFF4518D), // Warna latar belakang tombol
                                  onPrimary: Colors.white, // Warna teks tombol
                                ),
                                child: Text('Visit Linkedln',
                                    style: TextStyle(fontSize: 16)),
                              ),
                              SizedBox(width: 5),
                              ElevatedButton(
                                onPressed: () {
                                  // Handle button tap
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    foregroundColor: Color(0xFFF4518D),
                                    elevation: 0,
                                    side: const BorderSide(
                                        width: 1.0, color: Color(0xFFF4518D))),
                                child: Text('Save',
                                    style: TextStyle(fontSize: 16)),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Center(
              child: Card(
                color: Color(0xFFF8E8EE),
                margin: EdgeInsets.all(24.0),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  // padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('About the Job',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Company Description : PT OS Selnajaya Indonesia merupakan Perusahaan yang mengembangkan Jasa yang terkait sumber daya manusia secara komprehensif. Perusahaan ini tergabung ke dalam frup internasional outsourcing INC. Yang berkantor pusat di Tokyo dan tercatat dalam Bursa Efek Tokyo.',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Job Description:',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '       Based on posititon and experience',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              color: Color(0xFFF8E8EE),
              margin: EdgeInsets.all(24.0),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Set alert for similar jobs',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Engineer, Jakarta, Indonesia',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Handle button tap
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          foregroundColor: Color(0xFFF4518D),
                          elevation: 0,
                          side: const BorderSide(
                              width: 1.0, color: Color(0xFFF4518D))),
                      child: Text('Set Alert', style: TextStyle(fontSize: 16)),
                    )
                  ],
                ),
              ),
            ),
            Center(
              child: Card(
                color: Color(0xFFF8E8EE),
                margin: EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('About the Job',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Company Description : PT OS Selnajaya Indonesia merupakan Perusahaan yang mengembangkan Jasa yang terkait sumber daya manusia secara komprehensif. Perusahaan ini tergabung ke dalam frup internasional outsourcing INC. Yang berkantor pusat di Tokyo dan tercatat dalam Bursa Efek Tokyo.',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Job Description:',
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '       Based on position and experience',
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: FractionallySizedBox(
                        widthFactor: 1.00,
                        child: Padding(
                          padding: EdgeInsets.only(top: 17.0),
                          child: ElevatedButton(
                            onPressed: () {
                              // Handle button tap
                            },
                            child: Text('See More'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFFDCEDF),
                              minimumSize: Size(double.infinity,
                                  48), // Lebar tombol mengisi card penuh
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(
                                      12.0), // Mengotak bagian bawah kiri
                                  bottomRight: Radius.circular(
                                      12.0), // Mengotak bagian bawah kanan
                                ),
                              ),
                            ),
                          ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle button tap
        },
        backgroundColor: const Color.fromARGB(255, 245, 63, 126),
        shape: CircleBorder(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Open', style: TextStyle(color: Colors.white)),
            Text('Center', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(
          selectedIndex: _selectedIndex,
          onItemTapped: (index) {
            setState(() {
              _selectedIndex = index;
            });
          }),
    );
  }
}
