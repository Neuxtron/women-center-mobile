import 'package:flutter/material.dart';
import '../../../Models/favorit_model/konselorfav_model.dart';

class KonselorFav extends StatelessWidget {
  final List<KonselorFavModel> konselors = [
    KonselorFavModel(
      imageAsset: "Assets/images/konselor1.png",
      name: 'Stenafie Russel, M.Psi., Psikolog',
      titleAndUniversity: 'Psikolog  •  Universitas Indonesia',
      location: 'Jakarta',
    ),
    KonselorFavModel(
      imageAsset: "Assets/images/konselor2.png",
      name: 'Maryland Winkles, M.Psi., Psikolog',
      titleAndUniversity: 'Psikolog  •  Universitas gunadarma',
      location: 'Jakarta',
    ),
    KonselorFavModel(
      imageAsset: "Assets/images/konselor3.png",
      name: 'Janetta Rotolo, M.Psi., Psikolo',
      titleAndUniversity: 'Psikolog  •  Universitas gunadarma',
      location: 'Bogor',
    ),
    KonselorFavModel(
      imageAsset: "Assets/images/konselor4.png",
      name: 'Phyllis Godley, M.Psi., Psikolog',
      titleAndUniversity: 'Psikolog  •  Universitas tarumanegara',
      location: 'Medan',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: konselors.length,
      itemBuilder: (context, index) {
        return buildKonselorCard(context, konselors[index]);
      },
    );
  }

  Widget buildKonselorCard(BuildContext context, KonselorFavModel konselor) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 3, vertical: 5),
    child: Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 76,
              height: 93,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x19000000),
                    blurRadius: 14,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  konselor.imageAsset,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      konselor.name,
                      style: TextStyle(
                        color: Color(0xFF1F1F1F),
                        fontSize: 12,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      konselor.titleAndUniversity,
                      style: TextStyle(
                        color: Color(0xFFF4518D),
                        fontSize: 12,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Color(0xFFB3B3B3),
                          size: 14,
                        ),
                        SizedBox(width: 5),
                        Text(
                          konselor.location,
                          style: TextStyle(
                            color: Color(0xFF1F1F1F),
                            fontSize: 12,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
}