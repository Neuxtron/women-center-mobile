import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../Models/event_kalender/kalender_event.dart';
import '../../ViewModel/api_kalender_event/kalender_event.dart';

class KalenderEvent extends StatefulWidget {
  @override
  _KalenderEventState createState() => _KalenderEventState();
}

class _KalenderEventState extends State<KalenderEvent> {
  List<DateTime> selectedDates = [];
  bool isEditing = false;
  List<Event> events = [];
   final ApiKalender _apiKalender = ApiKalender();
  Map<String, dynamic> _userProfile = {};

  @override
  void initState() {
    super.initState();
    _fetchEventData();
  }

  Future<void> _fetchEventData() async {
  try {
    final response = await _apiKalender.getUserProfile();
    final eventData = response['data'];

    setState(() {
      events.add(
        Event(
          id: eventData['id'],
          title: eventData['title'],
          date: eventData['date'],
          timeStart: eventData['time_start'],
          timeFinish: eventData['time_finish'],
          eventUrl: eventData['event_url'],
        ),
      );
      dummyEvents = [DateFormat('dd MMM yyyy').parse(eventData['date'])];
    });
  } catch (error) {
    print('Error fetching user profile: $error');
  }
}


  List<DateTime> dummyEvents = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  backgroundColor: Color(0xFFFDCEDF),
  title: Text(
    'Kalender',
    style: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
  ),
  centerTitle: true,
  iconTheme: IconThemeData(color: Colors.black),
),
      backgroundColor: Color(0xFFF8E8EE),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!isEditing)
              Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Padding(
      padding: EdgeInsets.only(left: 25),
      child: Text(
        'Wed, ${DateFormat('MMM d').format(dummyEvents[0])}',
        style: GoogleFonts.roboto(fontSize: 32, fontWeight: FontWeight.w400),
      ),
    ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isEditing = !isEditing;
                      });
                    },
                    icon: Icon(Icons.edit),
                  ),
                ],
              ),
                if (!isEditing)
  Divider(),
            SizedBox(height: 16),
            if (isEditing)
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: () {
                              setState(() {
                                isEditing = false;
                              });
                            },
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {});
                        },
                        child: Text('Save', style: TextStyle(color: Color(0xFFf4518d))),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
      padding: EdgeInsets.only(left: 55),
                      child: Text(
                        'Depart - Return Dates',
                        style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.normal),
                      ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
      padding: EdgeInsets.only(left: 55),
                      child: Text(
                        '${DateFormat('MMM d').format(dummyEvents[0])}',
                        style: GoogleFonts.roboto(fontSize: 26, fontWeight: FontWeight.w400),
                      ),
                      ),
                      IconButton(
                        onPressed: () {
                          print('Edit Button Pressed');
                        },
                        icon: Icon(Icons.edit),
                      ),
                    ],
                  )
                ],
              ),
            Align(
              alignment: Alignment.topLeft,
              child: isEditing
                  ? CalendarDatePicker2(
                config: CalendarDatePicker2Config(
                  calendarType: CalendarDatePicker2Type.range,
                  selectedDayHighlightColor: Color(0xFFf4518d),
                ),
                value: dummyEvents,
              )
                  : CalendarDatePicker2(
                config: CalendarDatePicker2Config(
                  calendarType: CalendarDatePicker2Type.single,
                  selectedDayHighlightColor: Color(0xFFf4518d),
                ),
                value: dummyEvents,
              ),
            ),
            SizedBox(height: 30),
            Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
   if (!isEditing)
  Padding(
    padding: EdgeInsets.only(left: 15, top: 0, bottom: 0), // Sesuaikan nilai top dan bottom sesuai kebutuhan
    child: Text(
      'Acara',
      style: GoogleFonts.raleway(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
    ),
  ),
],
),
if (!isEditing)
  Expanded(
    child: Padding(
      padding: const EdgeInsets.only(top: 0), // Sesuaikan nilai top sesuai kebutuhan
      child: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          Event currentEvent = events[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Row(
                  children: [
                    Text(
                      currentEvent.timeStart,
                      style: TextStyle(fontSize: 13),
                    ),
                    SizedBox(width: 15),
                    Text(
                      currentEvent.title,
                      style: TextStyle(fontSize: 13),
                    ),
                  ],
                ),
                subtitle: Row(
                  children: [
                    Text(
                      currentEvent.timeFinish,
                      style: TextStyle(fontSize: 13),
                    ),
                    SizedBox(width: 15),
                    Text(
                      currentEvent.eventUrl,
                      style: TextStyle(fontSize: 13),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Color(0xFFf4518d),
                height: 0,
              ),

                      ],
                    );
                  },
                ),
              ),
  ),
          ],
        ),
      ),
    );
  }
}
