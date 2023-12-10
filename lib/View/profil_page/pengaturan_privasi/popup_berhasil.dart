import 'package:flutter/material.dart';

class PopupBerhasil extends StatelessWidget {
  const PopupBerhasil({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.check_circle,
          color: Color(0xFF95DE64),
          size: 64,
        ),
        Text(
          "Sandi Telah Diubah",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF6E726E),
          ),
        ),
        MaterialButton(
          onPressed: () {
            Navigator.pop(context);
          },
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          color: Color(0xFFF4518D),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          textColor: Colors.white,
          child: Text("Oke"),
        ),
      ],
    );
  }
}
