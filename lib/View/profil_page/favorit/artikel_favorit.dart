import 'package:flutter/material.dart';

class ArtikelFav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Container(
          width: 335,
          height: 93,
          // padding: const EdgeInsets.symmetric(horizontal: 16),
          color: Color.fromARGB(255, 255, 255, 255),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: const Column(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 18),
                          child: Text(
                            'Julia Amailia',
                            style: TextStyle(
                              color: Color(0xFFF4518D),
                              fontSize: 12,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 25),
                            child: Opacity(
                              opacity: 0.50,
                              child: Text(
                                '• 20 Oktober 2023',
                                style: TextStyle(
                                  color: Color(0xFF393938),
                                  fontSize: 12,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.w400,
                                  height: 0.14,
                                ),
                              ),
                            )),
                      ],
                    ),
                    SizedBox(
                      width: 208,
                      height: 38,
                      child: Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Text(
                          'Fakta Depresi di Malam Hari yang Perlu Kamu Tahu',
                          style: TextStyle(
                            color: Color(0xFF141514),
                            fontSize: 13,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 50),
              Container(
                width: 76, //76
                height: 93,
                decoration: const ShapeDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://via.placeholder.com/76x93"),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x19000000),
                      blurRadius: 14,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
