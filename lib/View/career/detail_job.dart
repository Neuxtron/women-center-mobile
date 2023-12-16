import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:women_center_mobile/Models/career_model/detail_career.dart';
import 'package:women_center_mobile/ViewModel/career_viewmodel/detail_career.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailJob extends StatefulWidget {
  final int jobId;
  DetailJob({required this.jobId, Key? key}) : super(key: key);

  @override
  _DetailJobState createState() => _DetailJobState();
}

class _DetailJobState extends State<DetailJob> {
  late DetailJobViewModel _detailJobViewModel;

  @override
  void initState() {
    super.initState();
    _detailJobViewModel =
        Provider.of<DetailJobViewModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[100],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
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
                child: FutureBuilder(
                    future: _detailJobViewModel.fetchJobDetail(widget.jobId),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        JobDetail jobDetail = _detailJobViewModel.jobDetail!;
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                              child: Image.network(
                                '${jobDetail.cover}',
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
                                    child: Image.network(
                                      '${jobDetail.logo}',
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(width: 15.0),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:
                                            200.0, // atur lebar sesuai kebutuhan
                                        child: Text(
                                          '${jobDetail.titleJob}',
                                          style: TextStyle(
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxLines: 2, // Maksimal dua baris
                                          overflow: TextOverflow
                                              .ellipsis, // Menambahkan elipsis jika teks terlalu panjang
                                          softWrap:
                                              true, // Membuat teks pindah baris secara otomatis
                                        ),
                                      ),
                                      Text(
                                        '${jobDetail.companyName}',
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
                                  Image.asset('Assets/images/briefcase.png',
                                      scale: 3),
                                  SizedBox(width: 10),
                                  Text(
                                    '${jobDetail.location}', // Ganti dengan teks yang diinginkan
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        color: Color(0xFFF646464)),
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
                                    '${jobDetail.sizeCompanyEmployee}', // Ganti dengan teks yang diinginkan
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: Color(0xFFF646464)),
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
                                  Image.asset('Assets/images/checklist.png',
                                      scale: 3),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      'Skills: ${jobDetail.requiredSkill}', // Ganti dengan teks yang diinginkan
                                      maxLines: 3,
                                      overflow: TextOverflow
                                          .ellipsis, // Gunakan ellipsis untuk menambahkan titik-titik jika melebihi batas
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: Color(0xFFF646464),
                                      ),
                                    ),
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
                                        onPressed: () async {
                                          String url = jobDetail.linkedinUrl;
                                          _launchURL(url);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: Color(
                                              0xFFF4518D), // Warna latar belakang tombol
                                          onPrimary:
                                              Colors.white, // Warna teks tombol
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
                                                width: 1.0,
                                                color: Color(0xFFF4518D))),
                                        child: Text('Save',
                                            style: TextStyle(fontSize: 16)),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }
                    }),
              ),
            ),
            FutureBuilder(
                future: _detailJobViewModel.fetchJobDetail(widget.jobId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    JobDetail jobDetail = _detailJobViewModel.jobDetail!;
                    return Center(
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
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                              SizedBox(height: 8),
                              Text(
                                '${jobDetail.aboutJob}',
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                }),
            FutureBuilder(
                future: _detailJobViewModel.fetchJobDetail(widget.jobId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    // JobDetail jobDetail = _detailJobViewModel.jobDetail!;
                    return Card(
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
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
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
                              child: Text('Set Alert',
                                  style: TextStyle(fontSize: 16)),
                            )
                          ],
                        ),
                      ),
                    );
                  }
                }),
            FutureBuilder(
                future: _detailJobViewModel.fetchJobDetail(widget.jobId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    JobDetail jobDetail = _detailJobViewModel.jobDetail!;
                    return Center(
                      child: Card(
                        color: Color(0xFFF8E8EE),
                        margin: EdgeInsets.all(24.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 16.0, right: 16.0, top: 16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('About the Job',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    '${jobDetail.aboutCompany}',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                    ),
                                    maxLines: 2, // Atur jumlah baris maksimum
                                    overflow: TextOverflow
                                        .ellipsis, // Gunakan ellipsis jika melebihi batas
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
                    );
                  }
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle button tap
          Navigator.pushNamed(context, '/chatbots');
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
    );
  }

  _launchURL(String url) async {
    try {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        // Fallback: Buka dengan package uni_links jika tidak bisa diluncurkan
        await launchWithUniLinks(url);
      }
    } catch (e) {
      print('Error launching URL: $e');
    }
  }

  Future<void> launchWithUniLinks(String url) async {
    try {
      await launch(url, forceWebView: false);
    } catch (e) {
      print('Error launching URL with uni_links: $e');
    }
  }
}
