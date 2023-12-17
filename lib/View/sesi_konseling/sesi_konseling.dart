import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:women_center_mobile/View/widgets/bottom_navigation_bar.dart';
import 'package:women_center_mobile/ViewModel/sesi_konseling_view_mdoel/sesi_konseling.dart';
import 'package:intl/intl.dart';

class SesiKonseling extends StatefulWidget {
  @override
  _SesiKonselingState createState() => _SesiKonselingState();
}

class _SesiKonselingState extends State<SesiKonseling> {
  int _selectedIndex = 0;
  late CounselingSessionViewModel _counselingsession;

  @override
  void initState() {
    super.initState();
    _counselingsession = Provider.of<CounselingSessionViewModel>(context, listen: false);
    _counselingsession.fetchcounselingsession();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFDCEDF),
        title: Center(
          child: Text(
            "Sesi Konseling",
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
                    children: [Text('Jadwal Terdekat')],
                  ),
                )
              ],
            ),
            Consumer<CounselingSessionViewModel>(
              builder: (context, counselingsessionviewmodel, _) {
                return ListView.separated(
                  shrinkWrap: true,
                  itemCount: counselingsessionviewmodel.conseling.length, 
                  separatorBuilder: (context, index) => SizedBox(height: 20),
                  itemBuilder: (context, index) {
                    final conseling = counselingsessionviewmodel.conseling[index];
                    return GestureDetector(
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
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Booking id:',
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(width: 175),
                                          Text(
                                            formatScheduleDate(conseling.dateSchedule),
                                            style: TextStyle(
                                                fontSize: 16.0, color: Colors.green),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        conseling.bookingId,
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Color(0xFFF4518D)),
                                      ),
                                    ],
                                  )
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
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        conseling.fullname,
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Paket:',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        conseling.packageType,
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(height: 15),
                              Row(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        formatDateWithDay(conseling.dateSchedule),
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
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
                                        formatTime(conseling.timeStart),
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFFF4518D)),
                                      ),
                                      Text(
                                        ' - ',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFFF4518D)),
                                      ),
                                      Text(
                                        formatTime(conseling.timeFinish),
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFFF4518D)),
                                      ),
                                      SizedBox(width: 140),
                                      InkWell(
                                        onTap: () {
                                          // Tindakan ketika ikon chat ditekan
                                        },
                                        child: Icon(Icons.chat_bubble,
                                            color: Color(0xFFF4518D), size: 27),
                                      ),
                                      SizedBox(width: 15),
                                      InkWell(
                                        onTap: () {
                                          // Tindakan ketika ikon videocam ditekan
                                        },
                                        child: Icon(Icons.videocam,
                                            color: Color(0xFFF4518D), size: 27),
                                      ),
                                      SizedBox(width: 15),
                                      InkWell(
                                        onTap: () {
                                          // Tindakan ketika ikon call ditekan
                                        },
                                        child: Icon(Icons.call,
                                            color: Color(0xFFF4518D), size: 27),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                );
              }
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
          }),
    );
  }
  // Fungsi untuk mengonversi format waktu
  String formatTime(String time) {
    // Parsing string waktu menjadi objek DateTime
    DateTime parsedTime = DateTime.parse("2023-12-16 $time");

    // Menggunakan DateFormat untuk memformat waktu ke dalam format yang diinginkan
    return "${parsedTime.hour.toString().padLeft(2, '0')}:${parsedTime.minute.toString().padLeft(2, '0')}";
  }
  // Fungsi untuk menentukan hari dari tanggal 
  String formatDateWithDay(String date) {
    // Parsing string tanggal
    DateTime parsedDate = DateFormat("dd MMM yyyy").parse(date);

    // Menggunakan DateFormat untuk memformat tanggal dengan nama hari
    return DateFormat("EEEE, dd MMM yyyy").format(parsedDate);
  }
  // Fungsi untuk konversi tanggal ke hari
  String formatScheduleDate(String date) {
    // Parsing string tanggal
    DateTime parsedDate = DateFormat("dd MMM yyyy").parse(date);

    // Hitung selisih waktu antara tanggal sekarang dan tanggal yang diterima dari API
    Duration difference = parsedDate.difference(DateTime.now());

    // Jika selisih kurang dari atau sama dengan 4 hari, tampilkan informasi "n hari lagi"
    if (difference.inDays <= 10) {
      return "${difference.inDays} hari lagi";
    } else {
      // Jika lebih dari 4 hari, tampilkan tanggal sebenarnya
      return DateFormat("dd MMM yyyy").format(parsedDate);
    }
  }
}
