import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:women_center_mobile/View/career/detail_job.dart';
import 'package:women_center_mobile/View/career/filter_item.dart';
import 'package:women_center_mobile/ViewModel/career_viewmodel/career.dart';
import 'package:women_center_mobile/ViewModel/career_viewmodel/detail_career.dart';
import 'package:women_center_mobile/ViewModel/career_viewmodel/filter_carrerr.dart';

import '../chatbot/chatbot_cs_view.dart';
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
  List<String> _filters = [];

  @override
  void initState() {
    super.initState();
    _jobViewModel = Provider.of<JobViewModel>(context, listen: false);
    _jobViewModel.fetchJobs();

    _filterjobtypesviewmodel =
        Provider.of<FilterJobTypesViewModel>(context, listen: false);
    _filterjobtypesviewmodel.fetchFilterJobTypes();
  }

  void onFilter(String jobName) {
    if (_filters.contains(jobName)) {
      setState(() {
        _filters.removeWhere((filterItem) => filterItem == jobName);
      });
    } else {
      setState(() => _filters.add(jobName));
    }
  }

  @override
  Widget build(BuildContext context) {
    context.read<JobViewModel>().fetchAllDetails();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        title: Text(
          'Karir',
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
              color: Colors.black,
              fontSize: 19.5,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        backgroundColor: const Color(0xFFFDCEDF),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xFFF8E8EE),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Column(
                children: [
                  const Align(
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
                      return SizedBox(
                        height: 60,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: filterJobTypesViewModel.filterjob.length,
                          itemBuilder: (context, index) {
                            final jobType =
                                filterJobTypesViewModel.filterjob[index];
                            return FilterItem(
                                jobType: jobType, onChange: onFilter);
                          },
                        ),
                      );
                    },
                  )
                ],
              ),
              const SizedBox(height: 15),
              const Divider(),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "For you",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
              const SizedBox(height: 7),
              const Divider(),

              // Tampilan list karir
              ListJobsView(filters: _filters),
              //

              const Divider(),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Other job",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),

              // Tampilan list karir
              ListJobsView(filters: _filters),
              //

              const SizedBox(height: 7),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ChatScreen()), 
          );
        },
        backgroundColor: const Color.fromARGB(255, 245, 63, 126),
        shape: const CircleBorder(),
        child: const Column(
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

class ListJobsView extends StatelessWidget {
  final List<String> filters;
  const ListJobsView({super.key, required this.filters});

  @override
  Widget build(BuildContext context) {
    return Consumer<JobViewModel>(
      builder: (context, jobViewModel, child) {
        if (jobViewModel.jobs.isEmpty) {
          // Menampilkan indikator loading jika data masih dimuat
          return const CircularProgressIndicator();
        } else {
          // Menampilkan data pekerjaan dengan ListView.separated
          final allJobs = context.watch<JobViewModel>().jobs;

          // Filter pekerjaan
          final filteredJobs = allJobs.where((job) {
            // log("-------");
            // log(filters.toString());
            // log(job.jobTypes.toString());
            for (var filterText in filters) {
              if (!job.jobTypes.contains(filterText)) return false;
            }
            return true;
          }).toList();
          // final filteredJobs = allJobs;

          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: filters.isEmpty ? allJobs.length : filteredJobs.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              final job =
                  filters.isEmpty ? allJobs[index] : filteredJobs[index];
              return GestureDetector(
                onTap: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailJob(jobId: job.id),
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
                          image: NetworkImage(
                              job.logo), // Menggunakan logo dari data pekerjaan
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15.0), // Jarak antara gambar dan teks
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          job.title, // Menggunakan title dari data pekerjaan
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFF4518D),
                          ),
                        ),
                        Text(
                          job.companyName, // Menggunakan companyName dari data pekerjaan
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          job.location, // Menggunakan location dari data pekerjaan
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          job.publishedAt, // Menggunakan publishedAt dari data pekerjaan
                          style: const TextStyle(
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
    );
  }
}
