import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:women_center_mobile/Models/konseling_model/konseling_model.dart';

class DetailSesiKonseling extends StatelessWidget {
  final KonselingModel? model;
  final Function() onBack;

  const DetailSesiKonseling({
    super.key,
    required this.model,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    Duration duration = const Duration(milliseconds: 500);
    bool isShown = model != null;

    return Stack(
      children: [
        Visibility(
          visible: isShown,
          child: GestureDetector(
            onTap: () => onBack,
            child: Opacity(
              opacity: model != null ? .4 : 0,
              child: Container(
                color: Colors.black,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: AnimatedContainer(
            duration: duration,
            curve: Curves.easeOutCubic,
            width: double.infinity,
            height: isShown ? 530 : 0,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
            ),
            child: isShown
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 24),
                        child: Text(
                          "Detail",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Row(
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 12),
                                child: Text(
                                  "Booking ID",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              Text("Nama"),
                              Text("Email"),
                              Text("Paket"),
                              Text("Sesi tersisa"),
                              Text("Sesi selesai"),
                            ],
                          ),
                          const SizedBox(width: 30),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 12),
                                child: Text(
                                  ": ${model!.id}",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFFF4518D),
                                  ),
                                ),
                              ),
                              Text(": ${model!.nama}"),
                              Text(": ${model!.email}"),
                              Text(": ${model!.paket}"),
                              Text(": ${3 - model!.jadwalSelesai().length}"),
                              Text(": ${model!.jadwalSelesai().length}"),
                            ],
                          )
                        ],
                      ),
                      const Text(
                        "\nJadwal Konseling\n",
                        style: TextStyle(fontSize: 16),
                      ),
                      model!.jadwalTersisa().isNotEmpty
                          ? JadwalView(
                              icon: Icons.arrow_circle_right_rounded,
                              iconColor: Colors.blue.shade700,
                              listJadwal: model!.jadwalTersisa(),
                              jadwalSesi: model!.jadwalSesi,
                            )
                          : const SizedBox(),
                      model!.jadwalSelesai().isNotEmpty
                          ? JadwalView(
                              icon: Icons.check_circle,
                              iconColor: Colors.green,
                              selesai: true,
                              listJadwal: model!.jadwalSelesai(),
                              jadwalSesi: model!.jadwalSesi,
                            )
                          : const SizedBox(),
                      MaterialButton(
                        color: Color(0xFFF4518D),
                        onPressed: onBack,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        textColor: Colors.white,
                        child: Text("Kembali"),
                      ),
                    ],
                  )
                : null,
          ),
        ),
      ],
    );
  }
}

class JadwalView extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final bool selesai;
  final List<JadwalKonseling> listJadwal;
  final List<JadwalKonseling> jadwalSesi;

  const JadwalView({
    super.key,
    required this.icon,
    required this.listJadwal,
    required this.jadwalSesi,
    required this.iconColor,
    this.selesai = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: iconColor),
        const SizedBox(width: 20),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: listJadwal.length,
            itemBuilder: (context, index) {
              final jadwal = listJadwal[index];
              final pos = jadwalSesi.indexOf(jadwal);
              final formatTgl =
                  DateFormat("EEEE, dd MMMM yyyy").format(jadwal.jadwal);
              final jamAwal = DateFormat("hh.00").format(jadwal.jadwal);
              final jamAkhir = DateFormat("hh.00").format(
                jadwal.jadwal.add(
                  const Duration(days: 1),
                ),
              );
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sesi $pos: $formatTgl",
                    style:
                        TextStyle(color: selesai ? Colors.grey : Colors.black),
                  ),
                  Text(
                    "$jamAwal - $jamAkhir",
                    style: TextStyle(
                      color: selesai ? Colors.grey : Color(0xFFF4518D),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
