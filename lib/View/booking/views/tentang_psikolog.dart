import 'package:flutter/material.dart';

class TentangPsikolog extends StatefulWidget {
  const TentangPsikolog({super.key});

  @override
  State<TentangPsikolog> createState() => _TentangPsikologState();
}

class _TentangPsikologState extends State<TentangPsikolog> {
  final List<String> _listKeahlian = [
    "Trauma",
    "Depresi",
    "Seksualitas",
    "Hubungan",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
            "Stefanie Russel merupakan seorang Psikolog Klinis Dewasa lulusan Universitas Indonesia (S1) yang memiliki pengalaman menangani kasus seperti depresi, kecemasan, trauma, hubungan dan dll."),
        const Text("Topik Keahlian"),
        SizedBox(
          height: 30,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _listKeahlian.length,
            itemBuilder: (context, index) {
              return TopikKeahlianItem(keahlian: _listKeahlian[index]);
            },
          ),
        ),
        const Text("Pendidikan"),
        const Text(" • S2 Universitas Indonesia"),
        const Text("Atur Jadwal"),
        const MingguItem(mingguKe: 1),
        const MingguItem(mingguKe: 2),
        const MingguItem(mingguKe: 3),
      ],
    );
  }
}

class TopikKeahlianItem extends StatelessWidget {
  final String keahlian;
  const TopikKeahlianItem({super.key, required this.keahlian});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF8E8EE),
        borderRadius: BorderRadius.circular(100),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Text(
        keahlian,
        style: const TextStyle(color: Color(0xFFF4518D)),
      ),
    );
  }
}

class MingguItem extends StatelessWidget {
  final int mingguKe;
  const MingguItem({super.key, required this.mingguKe});

  void pilihTanggal() {}

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text("Minggu ke-$mingguKe"),
        const Text("Tanggal"),
        TextField(
          readOnly: true,
          onTap: pilihTanggal,
          decoration: const InputDecoration(
            suffixIcon: Icon(Icons.date_range),
          ),
        ),
        const Text("Jam"),
        const PilihJam(),
      ],
    );
  }
}

class PilihJam extends StatefulWidget {
  const PilihJam({super.key});

  @override
  State<PilihJam> createState() => _PilihJamState();
}

class _PilihJamState extends State<PilihJam> {
  List<String> _listJam = [
    "09.00",
    "11.00",
    "13.00",
    "15.00",
    "19.00",
  ];
  String _selectedJam = "09.00";

  void changeJam(String jam) {
    setState(() => _selectedJam = jam);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        JamItem(
          value: _listJam[0],
          groupValue: _selectedJam,
          onChanged: changeJam,
        ),
        JamItem(
          value: _listJam[1],
          groupValue: _selectedJam,
          onChanged: changeJam,
        ),
        // JamItem(
        //   value: _listJam[2],
        //   groupValue: _selectedJam,
        //   onChanged: changeJam,
        // ),
        // JamItem(
        //   value: _listJam[3],
        //   groupValue: _selectedJam,
        //   onChanged: changeJam,
        // ),
        JamItem(
          value: _listJam[4],
          groupValue: _selectedJam,
          onChanged: changeJam,
          enabled: false,
        ),
      ],
    );
  }
}

class JamItem extends StatelessWidget {
  final String value;
  final String groupValue;
  final Function(String value) onChanged;
  final bool enabled;

  const JamItem({
    super.key,
    required this.value,
    required this.groupValue,
    this.enabled = true,
    required this.onChanged,
  });

  bool get _selected => value == groupValue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 120,
      child: MaterialButton(
        onPressed: enabled
            ? () {
                onChanged(value);
              }
            : null,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        color: _selected ? const Color(0xFFF4518D) : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        disabledColor: const Color(0xFFDFDFDF),
        textColor: _selected ? Colors.white : Colors.black,
        disabledTextColor: const Color(0xFF646464),
        child: Text(value),
      ),
    );
  }
}
