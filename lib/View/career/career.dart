import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:women_center_mobile/View/career/detail_job.dart';
import 'package:women_center_mobile/ViewModel/career_viewmodel/career.dart';
import 'package:women_center_mobile/ViewModel/career_viewmodel/detail_career.dart';
import 'package:women_center_mobile/ViewModel/career_viewmodel/filter_carrerr.dart';

import '../widgets/bottom_navigation_bar.dart';
import 'detail_job.dart';

class Career extends StatefulWidget {
  @override
  _CareerState createState() => _CareerState();
}

class _CareerState extends State<Career> {
  bool isButtonPressed = false;
  int _selectedIndex = 0;
  late JobViewModel _jobViewModel;
  bool isFilter = false;
  late FilterJobTypesViewModel _filterjobtypesviewmodel;
  @override
  void initState() {
    super.initState();
    _jobViewModel = Provider.of<JobViewModel>(context, listen: false);
    _jobViewModel.fetchJobs();

    _filterjobtypesviewmodel =
        Provider.of<FilterJobTypesViewModel>(context, listen: false);
    _filterjobtypesviewmodel.fetchFilterJobTypes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFFF8E8EE),
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Filter",
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  Consumer<FilterJobTypesViewModel>(
                    builder: (context, filterJobTypesViewModel, _) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children:
                              filterJobTypesViewModel.filterjob.map((filter) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    // Perform actions when the button is pressed
                                    // Misalnya, toggle filter pada view model
                                    filterJobTypesViewModel
                                        .toggleFilter(filter.name);
                                    isButtonPressed = !isButtonPressed;
                                    print(filter.name);
                                  });
                                },
                                child: Text(
                                  filter.name,
                                  style: TextStyle(
                                    color: isButtonPressed
                                        ? Colors.white
                                        : Color(0xFFF4518D),
                                    fontSize: 14,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: isButtonPressed
                                      ? Color(0xFFF4518D)
                                      : null,
                                  onPrimary: Colors
                                      .white, // Warna teks ketika tombol ditekan
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      );
                    },
                  )
                ],
              ),
              SizedBox(height: 15),
              Divider(),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "For you",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
              SizedBox(height: 7),
              Divider(),

              // setiap job dipasang inkwell seperti ini ya, juhar
              InkWell(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => DetailJob(),
                  //   ),
                  // );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Widget Consumer yang menampilkan daftar pekerjaan
                    Consumer<JobViewModel>(
                      builder: (context, jobViewModel, child) {
                        if (jobViewModel.jobs.isEmpty) {
                          // Menampilkan indikator loading jika data masih dimuat
                          return CircularProgressIndicator();
                        } else {
                          // Menampilkan data pekerjaan dengan ListView.separated
                          return ListView.separated(
                            shrinkWrap: true,
                            itemCount: jobViewModel.jobs.length,
                            separatorBuilder: (context, index) => Divider(),
                            itemBuilder: (context, index) {
                              final job = jobViewModel.jobs[index];
                              return GestureDetector(
                                onTap: () async {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DetailJob(jobId: job.id),
                                    ),
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 61,
                                      height: 61,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(job
                                              .logo), // Menggunakan logo dari data pekerjaan
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                        width:
                                            15.0), // Jarak antara gambar dan teks
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          job.title, // Menggunakan title dari data pekerjaan
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFFF4518D),
                                          ),
                                        ),
                                        Text(
                                          job.companyName, // Menggunakan companyName dari data pekerjaan
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          job.location, // Menggunakan location dari data pekerjaan
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        Text(
                                          job.publishedAt, // Menggunakan publishedAt dari data pekerjaan
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
              Divider(),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Other job",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Widget Consumer yang menampilkan daftar pekerjaan
                  Consumer<JobViewModel>(
                    builder: (context, jobViewModel, child) {
                      if (jobViewModel.jobs.isEmpty) {
                        // Menampilkan indikator loading jika data masih dimuat
                        return CircularProgressIndicator();
                      } else {
                        // Menampilkan data pekerjaan dengan ListView.separated
                        return ListView.separated(
                          shrinkWrap: true,
                          itemCount: jobViewModel.jobs.length,
                          separatorBuilder: (context, index) =>
                              Divider(), // Menambahkan Divider di antara setiap item
                          itemBuilder: (context, index) {
                            final job = jobViewModel.jobs[index];
                            return GestureDetector(
                              onTap: () async {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DetailJob(jobId: job.id),
                                  ),
                                );
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 61,
                                    height: 61,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(job
                                            .logo), // Menggunakan logo dari data pekerjaan
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                      width:
                                          15.0), // Jarak antara gambar dan teks
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        job.title, // Menggunakan title dari data pekerjaan
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFFF4518D),
                                        ),
                                      ),
                                      Text(
                                        job.companyName, // Menggunakan companyName dari data pekerjaan
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        job.location, // Menggunakan location dari data pekerjaan
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Text(
                                        job.publishedAt, // Menggunakan publishedAt dari data pekerjaan
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
              SizedBox(height: 7),
            ],
          ),
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
    );
  }
}
