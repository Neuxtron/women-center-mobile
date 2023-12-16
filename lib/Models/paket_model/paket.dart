class PaketModel {
  final int id;
  final String judul;
  final int sesi;
  final List daftar;
  final int hargaAsli;
  final int hargaDiskon;

  PaketModel({
    required this.id,
    required this.judul,
    required this.sesi,
    this.daftar = const [
      "Ruang Konseling Yang Nyaman & Aman",
      "Langsung Bertemu Psikolog \n & Konseling Tatap Muka",
      "Durasi Konsultasi 2 Jam/Sesi",
      "1on1 Dengan Konselor",
      "Privasi Dijamin 100% Aman",
      "Tes Kesehatan Mental",
      "Tes Kepribadian",
      "Tes Minat Karir",
      "Masa Aktif Paket Selama 1 Minggu",
    ],
    required this.hargaAsli,
    required this.hargaDiskon,
  });

  factory PaketModel.fromJson(Map<String, dynamic> json) {
    return PaketModel(
      id: json["id"],
      judul: json["title"],
      sesi: json["session_per_week"],
      hargaAsli: int.tryParse(json["price"]) ?? 0 + 100000,
      hargaDiskon: int.tryParse(json["price"]) ?? 0,
    );
  }
}
