class KonselingModel {
  final String id;
  final String nama;
  final String email;
  final String paket;
  final List<JadwalKonseling> jadwalSesi;

  KonselingModel({
    required this.id,
    required this.nama,
    required this.email,
    required this.paket,
    required this.jadwalSesi,
  });

  List<JadwalKonseling> jadwalSelesai() {
    return jadwalSesi.where((jadwal) => jadwal.selesai).toList();
  }

  List<JadwalKonseling> jadwalTersisa() {
    return jadwalSesi.where((jadwal) => !jadwal.selesai).toList();
  }
}

class JadwalKonseling {
  final DateTime jadwal;
  final bool selesai;

  JadwalKonseling({
    required this.jadwal,
    required this.selesai,
  });
}
