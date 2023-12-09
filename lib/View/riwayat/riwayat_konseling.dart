import 'package:flutter/material.dart';

class RiwayatKonseling extends StatelessWidget {
  const RiwayatKonseling({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Riwayat Konseling')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          DropdownButton<String>(
            items: <String>['semua', 'selesai','terjadwal','dibatalkan']
                .map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
            },
            value: 'semua',
            underline: Container(), 
          ),
        ],
      ),
    );
  }
}

