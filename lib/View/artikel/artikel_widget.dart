import 'package:flutter/material.dart';
import 'package:women_center_mobile/Models/artikel_model/artikel_model.dart';
import 'package:women_center_mobile/View/artikel_2/artikel_2.dart';

class ArtikelWidget extends StatefulWidget {
  final List<ArtikelModel> artikelList;

  const ArtikelWidget({Key? key, required this.artikelList}) : super(key: key);

  @override
  State<ArtikelWidget> createState() => _ArtikelWidgetState();
}

class _ArtikelWidgetState extends State<ArtikelWidget> {
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
    return Container(
      color: Colors.grey[50],
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          //-------------- SEARCH BUTTON -----------------
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Cari artikel",
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
              SizedBox(height: 15),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Pilihan topik",
                ),
              ),
              //-----------Button Topic---------------------
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    Row(
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
                          child: Text('Berita Wanita',
                              style:
                                  TextStyle(color: _textColor1, fontSize: 14)),
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
                          child: Text('Teknologi',
                              style:
                                  TextStyle(color: _textColor2, fontSize: 14)),
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
                          child: Text('Karier',
                              style:
                                  TextStyle(color: _textColor3, fontSize: 14)),
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
                          child: Text('Seni & Kreatifitas',
                              style:
                                  TextStyle(color: _textColor4, fontSize: 14)),
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
                          child: Text('Gaya Hidup',
                              style:
                                  TextStyle(color: _textColor5, fontSize: 14)),
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
                          child: Text('Mental Health',
                              style:
                                  TextStyle(color: _textColor6, fontSize: 14)),
                          style: ElevatedButton.styleFrom(primary: _warna6),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              //-----------------------ARTIKEL LIST-----------------------------
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: widget.artikelList.length,
                        itemBuilder: (context, index) {
                          // return buildArtikelCard(widget.artikelList[index]);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildArtikelCard(ArtikelModel artikel) {
    // ini ditambahin si juhar
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Artikel2(model: artikel),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network( // diubah ke network image, bukan asset image
              artikel.thumbnail,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Oleh: ${artikel.author.name}"),
                      Text("${artikel.publishedAt}"),
                    ],
                  ),
                  Text(
                    artikel.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 5.0), // Spacer between title and subtitle
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
