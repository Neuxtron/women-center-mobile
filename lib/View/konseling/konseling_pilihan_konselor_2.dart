import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:women_center_mobile/Models/utils/navigation_service.dart';

import '../../Models/utils/auth_service.dart';

class KonselingPilihanKonselor2 extends StatefulWidget {
  @override
  _KonselingPilihanKonselor2State createState() =>
      _KonselingPilihanKonselor2State();
}

class _KonselingPilihanKonselor2State extends State<KonselingPilihanKonselor2> {
  List<dynamic> counselorData = [];

  @override
  void initState() {
    super.initState();
    fetchData(); // Panggil fungsi untuk memuat data ketika widget pertama kali dibuat
  }
 String get token => AuthService.token;

  Future<void> fetchData() async {
    final url = Uri.parse('https://api-ferminacare.tech/api/v1/counselors');
   
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      setState(() {
        counselorData = json.decode(response.body)['data'];
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: counselorData.map<Widget>((counselor) {
        return CardData(
          judul: '${counselor['first_name']} ${counselor['last_name']}',
          subtitleKanan: counselor[
              'status'], //Ini nanti diubah ke data universitas karna belum ada di BE
          imagePath: counselor['profile_picture'],
        );
      }).toList(),
    );
  }
}

class CardData extends StatelessWidget {
  final String judul;
  final String subtitleKanan;
  final String imagePath;

  const CardData({
    Key? key,
    required this.judul,
    required this.subtitleKanan,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          NavigationService.navigatorKey.currentContext ?? context,
          "/booking",
        );
      },
      child: SizedBox(
        height: 160,
        child: Card(
          margin: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 110,
                  width: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(
                      imagePath,
                      loadingBuilder: (context, child, progress) {
                        return progress == null
                            ? child
                            : Center(child: CircularProgressIndicator());
                      },
                      errorBuilder: (context, error, stackTrace) =>
                          Icon(Icons.error),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        judul,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              subtitleKanan,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
