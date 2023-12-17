import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:women_center_mobile/ViewModel/konseling_konselor_view_model.dart/konseling_konselor_view_model.dart';

import '../../Models/konseling_model/konseling_model.dart';
import 'detail_sesi_konseling.dart';

class SesiKonseling extends StatefulWidget {
  @override
  _SesiKonselingState createState() => _SesiKonselingState();
}

class _SesiKonselingState extends State<SesiKonseling> {
  KonselingModel? _selectedKonseling;
  List<KonselingModel> get _listKonseling =>
      context.read<KonselingKonselorViewModel>().listKonseling;
  // final KonselingModel _dummyKonseling = KonselingModel(
  //   id: "8912yv12v",
  //   nama: "Aurel Adisti",
  //   email: "aureladisti@gmail.com",
  //   paket: "Voice Call",
  //   jadwalSesi: [
  //     JadwalKonseling(
  //       tanggal: DateTime.parse("2023-10-03"),
  //       jamAwal: const TimeOfDay(hour: 9, minute: 0),
  //       jamAkhir: const TimeOfDay(hour: 10, minute: 0),
  //     ),
  //     JadwalKonseling(
  //       tanggal: DateTime.parse("2024-10-14"),
  //       jamAwal: const TimeOfDay(hour: 9, minute: 0),
  //       jamAkhir: const TimeOfDay(hour: 10, minute: 0),
  //     ),
  //     JadwalKonseling(
  //       tanggal: DateTime.parse("2024-10-17"),
  //       jamAwal: const TimeOfDay(hour: 9, minute: 0),
  //       jamAkhir: const TimeOfDay(hour: 10, minute: 0),
  //     ),
  //   ],
  // );

  void bukaDetail(KonselingModel? konseling) async {
    setState(() => _selectedKonseling = konseling);
    if (konseling != null) {
      KonselingModel? modelBaru = await context
          .read<KonselingKonselorViewModel>()
          .fetchDetail(konseling.id);
      if (modelBaru != null) {
        setState(() {
          konseling.jadwalSesi = modelBaru.jadwalSesi;
          konseling.email = modelBaru.email;
        });
      }
    }
  }

  void fetchData() {
    context.read<KonselingKonselorViewModel>().fetchAllKonseling();
  }

  @override
  Widget build(BuildContext context) {
    fetchData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFDCEDF),
        title: const Center(
          child: Text(
            "Riwayat Konseling",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const Row(
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
                InkWell(
                  onTap: () {
                    // TODO: Masih data dummy yaaaa
                    bukaDetail(
                        _listKonseling.isEmpty ? null : _listKonseling[0]);
                  },
                  child: Card(
                    color: Colors.white,
                    margin: const EdgeInsets.only(left: 13, right: 13),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Booking id:',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        ' 8912yv12v',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            color: Color(0xFFF4518D)),
                                      ),
                                      SizedBox(width: 130),
                                      Text(
                                        'Hari ini',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.green),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Row(
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
                                    'Aurel Adisti',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Row(
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
                                    'All in One',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          const Row(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Senin, 3 Oktober 2023',
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
                                  const Text(
                                    '09.00 - 10.00',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFF4518D)),
                                  ),
                                  const SizedBox(width: 138),
                                  InkWell(
                                    onTap: () {
                                      // Tindakan ketika ikon chat ditekan
                                    },
                                    child: const Icon(Icons.chat_bubble,
                                        color: Color(0xFFF4518D), size: 27),
                                  ),
                                  const SizedBox(width: 15),
                                  InkWell(
                                    onTap: () {
                                      // Tindakan ketika ikon videocam ditekan
                                    },
                                    child: const Icon(Icons.videocam,
                                        color: Color(0xFFF4518D), size: 27),
                                  ),
                                  const SizedBox(width: 15),
                                  InkWell(
                                    onTap: () {
                                      // Tindakan ketika ikon call ditekan
                                    },
                                    child: const Icon(Icons.call,
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
                ),
                InkWell(
                  onTap: () {
                    // TODO: Masih data dummy yaaaa
                    bukaDetail(
                        _listKonseling.isEmpty ? null : _listKonseling[0]);
                  },
                  child: Card(
                    color: Colors.white,
                    margin: const EdgeInsets.only(left: 13, right: 13, top: 15),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Booking id:',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        ' s124hdgsf3',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            color: Color(0xFFF4518D)),
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
                          const SizedBox(height: 10),
                          const Row(
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
                                    'Aurel Adisti',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Row(
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
                                    'Video Call',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          const Row(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Senin, 12 Oktober 2023',
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
                                  const Text(
                                    '13.00 - 14.00',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFF4518D)),
                                  ),
                                  const SizedBox(width: 138),
                                  InkWell(
                                    onTap: () {
                                      // Tindakan ketika ikon chat ditekan
                                    },
                                    child: const Icon(Icons.chat_bubble,
                                        color: Color(0xFFF4518D), size: 27),
                                  ),
                                  const SizedBox(width: 15),
                                  InkWell(
                                    onTap: () {
                                      // Tindakan ketika ikon videocam ditekan
                                    },
                                    child: const Icon(Icons.videocam,
                                        color: Color(0xFFF4518D), size: 27),
                                  ),
                                  const SizedBox(width: 15),
                                  InkWell(
                                    onTap: () {
                                      // Tindakan ketika ikon call ditekan
                                    },
                                    child: const Icon(Icons.call,
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
                ),
                InkWell(
                  onTap: () {
                    // TODO: Masih data dummy yaaaa
                    bukaDetail(
                        _listKonseling.isEmpty ? null : _listKonseling[0]);
                  },
                  child: Card(
                    color: Colors.white,
                    margin: const EdgeInsets.only(left: 13, right: 13, top: 15),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Booking id:',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        ' jasd73284',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            color: Color(0xFFF4518D)),
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
                          const SizedBox(height: 10),
                          const Row(
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
                                    'Aurel Adisti',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Row(
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
                                    'Video Call',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          const Row(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Senin, 3 Oktober 2023',
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
                                  const Text(
                                    '09.00 - 10.00',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFF4518D)),
                                  ),
                                  const SizedBox(width: 138),
                                  InkWell(
                                    onTap: () {
                                      // Tindakan ketika ikon chat ditekan
                                    },
                                    child: const Icon(Icons.chat_bubble,
                                        color: Color(0xFFF4518D), size: 27),
                                  ),
                                  const SizedBox(width: 15),
                                  InkWell(
                                    onTap: () {
                                      // Tindakan ketika ikon videocam ditekan
                                    },
                                    child: const Icon(Icons.videocam,
                                        color: Color(0xFFF4518D), size: 27),
                                  ),
                                  const SizedBox(width: 15),
                                  InkWell(
                                    onTap: () {
                                      // Tindakan ketika ikon call ditekan
                                    },
                                    child: const Icon(Icons.call,
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
                ),
              ],
            ),
          ),
          DetailSesiKonseling(
            model: _selectedKonseling,
            onBack: () => bukaDetail(null),
          ),
        ],
      ),
      // bottomNavigationBar: MyBottomNavigationBar(
      //     selectedIndex: _selectedIndex,
      //     onItemTapped: (index) {
      //       setState(() {
      //         _selectedIndex = index;
      //       });
      //     }),
    );
  }
}
