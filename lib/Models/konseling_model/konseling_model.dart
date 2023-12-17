import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class KonselingModel {
  final String id;
  final String nama;
  String email;
  final String paket;
  List<JadwalKonseling> jadwalSesi;

  KonselingModel({
    required this.id,
    required this.nama,
    this.email = "",
    required this.paket,
    required this.jadwalSesi,
  });

  List<JadwalKonseling> jadwalSelesai() {
    return jadwalSesi.where((jadwal) => jadwal.selesai).toList();
  }

  List<JadwalKonseling> jadwalTersisa() {
    return jadwalSesi.where((jadwal) => !jadwal.selesai).toList();
  }

  factory KonselingModel.fromJson(Map<String, dynamic> json) {
    return KonselingModel(
      id: json["booking_id"],
      nama: json["fullname"],
      paket: json["package"],
      jadwalSesi: [JadwalKonseling.fromJson(json)],
    );
  }
}

class JadwalKonseling {
  final DateTime tanggal;
  final TimeOfDay jamAwal;
  final TimeOfDay jamAkhir;

  JadwalKonseling({
    required this.tanggal,
    required this.jamAwal,
    required this.jamAkhir,
  });

  DateTime get tglAwal => DateTime(
        tanggal.year,
        tanggal.month,
        tanggal.day,
        jamAwal.hour,
        jamAwal.minute,
      );
  DateTime get tglAkhir => DateTime(
        tanggal.year,
        tanggal.month,
        tanggal.day,
        jamAkhir.hour,
        jamAkhir.minute,
      );

  bool get selesai => DateTime.now().isAfter(tglAkhir);

  factory JadwalKonseling.fromJson(Map<String, dynamic> json) {
    final dateFormatter = DateFormat("dd MMM yyyy");
    final timeFormatter = DateFormat("hh:mm:ss");

    return JadwalKonseling(
      tanggal: dateFormatter.parse(json["date_schedule"]),
      jamAwal: TimeOfDay.fromDateTime(
        timeFormatter.parse(json["time_start"]),
      ),
      jamAkhir: TimeOfDay.fromDateTime(
        timeFormatter.parse(json["time_finish"]),
      ),
    );
  }
}
