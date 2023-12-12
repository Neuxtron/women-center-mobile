import 'package:flutter/material.dart';

class ChatKonseling extends StatefulWidget {
  @override
  _ChatKonselingState createState() => _ChatKonselingState();
}

class _ChatKonselingState extends State<ChatKonseling> {
  final TextEditingController _textController = TextEditingController();
  final List<ChatMessage> _messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 20,
        backgroundColor: Color(0xffFDCEDF),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FotoProfil(),
            SizedBox(width: 10),
            Text(
              'Stenafie Russel, M.Psi., Psikolog',
              style: TextStyle(
                color: (Color(0xff1f1f1f)),
                fontSize: 14,
              ),
            ),
          ],
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return _messages[index];
              },
            ),
          ),
          Divider(height: 1.0),
          _buildTextComposer(),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Kirim pesan',
                // Atur padding di dalam TextField
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
                suffixIcon: Icon(
                  Icons.mic,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Container(
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (Color(0xffF4518D)),
            ),
            padding: EdgeInsets.all(5.0), // Padding lingkaran
            child: IconButton(
              icon: Transform.rotate(
                angle: 45 * 3.14 / 12, // Rotasi sebesar 45 derajat
                child: Icon(
                  Icons.send,
                  color: Colors.white, // Warna ikon send sesuai keinginan
                ),
              ),
              onPressed: () {
                _handleSubmitted(_textController.text);
              },
              iconSize: 30.0, // Atur ukuran ikon send sesuai keinginan
              color: Colors
                  .transparent, // Warna latar belakang ikon send menjadi transparan
              splashColor: Colors.transparent, // Hilangkan efek klik ikon send
              highlightColor:
                  Colors.transparent, // Hilangkan efek klik ikon send
              tooltip: 'Send', // Tampilkan tooltip sesuai keinginan
            ),
          )
        ],
      ),
    );
  }

  void _handleSubmitted(String text) {
    DateTime currentTime = DateTime.now();
    setState(() {
      ChatMessage message = ChatMessage(
        text: text,
        time: currentTime,
      );
      _messages.insert(0, message);
      _textController.clear();
    });
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final DateTime time;

  ChatMessage({
    required this.text,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(right: 8.0),
            child: FotoProfil(),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Color(0xFFF4518D),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    _formatTime(time),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatTime(DateTime time) {
    return "${time.hour}:${time.minute}";
  }
}

class FotoProfil extends StatelessWidget {
  const FotoProfil({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: NetworkImage(
          "https://akcdn.detik.net.id/visual/2015/01/06/3145081d-6a92-4c32-a8d6-065203f5097c_169.jpg?w=400&q=90"),
    );
  }
}
