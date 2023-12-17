import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:women_center_mobile/Models/utils/navigation_service.dart';
import 'package:women_center_mobile/ViewModel/konselor_view_model/konselor_view_model.dart';

class TentangPsikolog extends StatefulWidget {
  final String description;
  final List<int> schedule;
  final int konselorId;
  final int paketId;

  const TentangPsikolog({
    super.key,
    required this.description,
    required this.schedule,
    required this.konselorId,
    required this.paketId,
  });

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

  final List<DateTime?> _listTanggal = [null, null, null];

  void updateTanggal(int index, DateTime tgl) {
    _listTanggal[index] = tgl;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // const Text(
        //     "Stefanie Russel merupakan seorang Psikolog Klinis Dewasa lulusan Universitas Indonesia (S1) yang memiliki pengalaman menangani kasus seperti depresi, kecemasan, trauma, hubungan dan dll."),
        Text(widget.description),
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
        MingguItem(
          index: 0,
          onChange: updateTanggal,
          schedule: widget.schedule,
        ),
        MingguItem(
          index: 1,
          onChange: updateTanggal,
          schedule: widget.schedule,
        ),
        MingguItem(
          index: 2,
          onChange: updateTanggal,
          schedule: widget.schedule,
        ),
        MaterialButton(
          minWidth: double.infinity,
          onPressed: () async {
            // TODO: post ke api
            final response = await context.read<KonselorViewModel>().booking(
                  widget.konselorId,
                  widget.paketId,
                  _listTanggal,
                );

            if (response) {
              final orderIdviewModel = context.read<KonselorViewModel>().order_id;
              log("di view model: $orderIdviewModel");
              
              final prefs = await SharedPreferences.getInstance();
              final orderIdLocalStorage = prefs.getString("order_id");
              log("di localstorage: $orderIdLocalStorage");
              
              Navigator.pushNamed(
                NavigationService.navigatorKey.currentContext ?? context,
                "/pembayaran1",
              );
            }
          },
          color: Color(0xFFF4518D),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          textColor: Colors.white,
          child: Text("Booking"),
        ),
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

class MingguItem extends StatefulWidget {
  final int index;
  final List<int> schedule;
  final Function(int index, DateTime tgl) onChange;

  const MingguItem({
    super.key,
    required this.index,
    required this.onChange,
    required this.schedule,
  });

  @override
  State<MingguItem> createState() => _MingguItemState();
}

class _MingguItemState extends State<MingguItem> {
  final _tglController = TextEditingController();

  void pilihTanggal() async {
    final tgl = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1, DateTime.now().month),
    );

    log(tgl?.weekday.toString() ?? "");
    log(widget.schedule.toString());
    log(widget.schedule.contains(tgl?.weekday).toString());

    if (tgl != null && widget.schedule.contains(tgl.weekday)) {
      setState(() {
        _tglController.text = DateFormat("EEEE, d MMMM yyyy").format(tgl);
      });
      widget.onChange(widget.index, tgl);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text("Minggu ke-${widget.index + 1}"),
        const Text("Tanggal"),
        TextField(
          readOnly: true,
          onTap: pilihTanggal,
          controller: _tglController,
          style: TextStyle(fontSize: 14),
          decoration: InputDecoration(
            suffixIcon: const Icon(Icons.date_range),
            suffixIconColor: const Color(0xFFF4518D),
            fillColor: Colors.white,
            filled: true,
            isDense: true,
            hintText: "Pilih tanggal",
            enabledBorder: borderSaya(),
            focusedBorder: borderSaya(),
          ),
        ),
        const Text("Jam"),
        const PilihJam(),
      ],
    );
  }

  InputBorder borderSaya() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide.none,
    );
  }
}

class PilihJam extends StatefulWidget {
  const PilihJam({super.key});

  @override
  State<PilihJam> createState() => _PilihJamState();
}

class _PilihJamState extends State<PilihJam> {
  final List<String> _listJam = [
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
        JamItem(
          value: _listJam[2],
          groupValue: _selectedJam,
          onChanged: changeJam,
        ),
        JamItem(
          value: _listJam[3],
          groupValue: _selectedJam,
          onChanged: changeJam,
        ),
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
      height: 30,
      width: 60,
      child: MaterialButton(
        onPressed: enabled
            ? () {
                onChanged(value);
              }
            : null,
        elevation: 0,
        highlightElevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        color: _selected ? const Color(0xFFF4518D) : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: _selected || !enabled
              ? BorderSide.none
              : const BorderSide(color: Color(0xFFC9C9C9)),
        ),
        disabledColor: const Color(0xFFDFDFDF),
        textColor: _selected ? Colors.white : Colors.black,
        disabledTextColor: const Color(0xFF646464),
        child: Text(value),
      ),
    );
  }
}
