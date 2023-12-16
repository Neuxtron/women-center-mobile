import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EventData {
  final String title;
  final String description;
  final String poster;
  final String date;
  final String locations;
  final int price;

  EventData({
    required this.title,
    required this.description,
    required this.poster,
    required this.date,
    required this.locations,
    required this.price,
  });
}

class DetailEvent extends StatefulWidget {
  @override
  _DetailEventState createState() => _DetailEventState();
}

class _DetailEventState extends State<DetailEvent> {
  Future<EventData> fetchData() async {
    final String apiUrl = 'https://api-ferminacare.tech/api/v1/event/1';
    final String bearerToken =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZnVsbF9uYW1lIjoicHV0cmlkaWFuYSIsImVtYWlsIjoicHV0cmlAZ21haWwuY29tIiwicm9sZSI6InVzZXIiLCJleHAiOjE3MDI3NTA4MDV9.iMDpdy196frh4qrbq6M5hAXzXM56Fj2aN3Zz1O9krXA';

    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        'Authorization': 'Bearer $bearerToken',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> eventData = json.decode(response.body)['data'];
      return EventData(
        title: eventData['title'],
        description: eventData['description'],
        poster: eventData['poster'],
        date: eventData['date'],
        locations: eventData['locations'],
        price: eventData['price'],
      );
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, // Untuk posisikan teks judul di tengah
        title: Text(
          'Event Details',
          style: TextStyle(
            fontWeight: FontWeight.bold, // Untuk memberi tebal pada teks
          ),
        ),
      ),
      body: FutureBuilder<EventData>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final eventData = snapshot.data!;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.network(
                    eventData.poster,
                    fit: BoxFit.fitWidth,
                    width: double.infinity,
                    height: 200.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          eventData.title,
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.location_on,
                                  color: const Color(0xFFF4518D),
                                ),
                                const SizedBox(width: 4.0),
                                Text(
                                  eventData.locations,
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    color: const Color(0xFFF4518D),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.date_range,
                                  color: const Color(0xFFF4518D),
                                ),
                                const SizedBox(width: 10.0),
                                Text(
                                  eventData.date,
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    color: const Color(0xFFF4518D),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 25.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 4.0,
                                horizontal: 8.0,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: const Color(
                                  0xFFF4518D,
                                ),
                              ),
                              child: Text(
                                '\Rp${eventData.price.toString()}',
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25.0),
                        Card(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors
                                  .white, // Ganti warna latar belakang di sini
                              border: Border.all(
                                color: const Color(0xFFF4518D),
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  const Text(
                                    'Deskripsi Event',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8.0),
                                  Text(
                                    eventData.description,
                                    style: const TextStyle(
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
