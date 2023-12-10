import 'package:flutter/material.dart';

class konseling_pilihan_konselor_1 extends StatefulWidget {
  @override
  _konseling_pilihan_konselor_1State createState() =>
      _konseling_pilihan_konselor_1State();
}

class _konseling_pilihan_konselor_1State
    extends State<konseling_pilihan_konselor_1> {
  Color _warna1 = Colors.white;
  Color _textColor1 = Colors.black;
  Color _warna2 = Colors.white;
  Color _textColor2 = Colors.black;
  Color _warna3 = Colors.white;
  Color _textColor3 = Colors.black;
  Color _warna4 = Colors.white;
  Color _textColor4 = Colors.black;
  Color _warna5 = Colors.white;
  Color _textColor5 = Colors.black;
  Color _warna6 = Colors.white;
  Color _textColor6 = Colors.black;

  @override
  Widget build(BuildContext context) {
    // appBar: AppBar(
    //   backgroundColor: Colors.pink[100],
    //   leading: IconButton(
    //     icon: Icon(Icons.arrow_back),
    //     onPressed: () {},
    //   ),
    //   title: Center(
    //     child: Text(
    //       "Konseling",
    //       style: TextStyle(
    //         fontWeight: FontWeight.bold,
    //       ),
    //     ),
    //   ),
    // ),
    return Container(
      color: Colors.grey[200],
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Cari nama psikolog",
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color(0xFF979797),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.all(10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 15.0),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Icon(
                    Icons.filter_list,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 25.0),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Pilihan topik",
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
          SizedBox(height: 15.0),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _warna1 = (_warna1 == Colors.white)
                          ? const Color.fromRGBO(244, 81, 141, 1)
                          : Colors.white;
                      _textColor1 = (_textColor1 == Colors.black)
                          ? Colors.white
                          : Colors.black;
                    });
                  },
                  child: Text('Trauma',
                      style: TextStyle(color: _textColor1, fontSize: 14)),
                  style: ElevatedButton.styleFrom(primary: _warna1),
                ),
                SizedBox(width: 10.0),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _warna2 = (_warna2 == Colors.white)
                          ? const Color.fromRGBO(244, 81, 141, 1)
                          : Colors.white;
                      _textColor2 = (_textColor2 == Colors.black)
                          ? Colors.white
                          : Colors.black;
                    });
                  },
                  child: Text('Depresi',
                      style: TextStyle(color: _textColor2, fontSize: 14)),
                  style: ElevatedButton.styleFrom(primary: _warna2),
                ),
                SizedBox(width: 10.0),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _warna3 = (_warna3 == Colors.white)
                          ? const Color.fromRGBO(244, 81, 141, 1)
                          : Colors.white;
                      _textColor3 = (_textColor3 == Colors.black)
                          ? Colors.white
                          : Colors.black;
                    });
                  },
                  child: Text('Seksualitas',
                      style: TextStyle(color: _textColor3, fontSize: 14)),
                  style: ElevatedButton.styleFrom(primary: _warna3),
                ),
                SizedBox(width: 10.0),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _warna4 = (_warna4 == Colors.white)
                          ? const Color.fromRGBO(244, 81, 141, 1)
                          : Colors.white;
                      _textColor4 = (_textColor4 == Colors.black)
                          ? Colors.white
                          : Colors.black;
                    });
                  },
                  child: Text('Seksualitas',
                      style: TextStyle(color: _textColor4, fontSize: 14)),
                  style: ElevatedButton.styleFrom(primary: _warna4),
                ),
                SizedBox(width: 10.0),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _warna5 = (_warna5 == Colors.white)
                          ? const Color.fromRGBO(244, 81, 141, 1)
                          : Colors.white;
                      _textColor5 = (_textColor5 == Colors.black)
                          ? Colors.white
                          : Colors.black;
                    });
                  },
                  child: Text('Hubungan',
                      style: TextStyle(color: _textColor5, fontSize: 14)),
                  style: ElevatedButton.styleFrom(primary: _warna5),
                ),
                SizedBox(width: 10.0),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _warna6 = (_warna6 == Colors.white)
                          ? const Color.fromRGBO(244, 81, 141, 1)
                          : Colors.white;
                      _textColor6 = (_textColor6 == Colors.black)
                          ? Colors.white
                          : Colors.black;
                    });
                  },
                  child: Text('Karir',
                      style: TextStyle(color: _textColor6, fontSize: 14)),
                  style: ElevatedButton.styleFrom(primary: _warna6),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
