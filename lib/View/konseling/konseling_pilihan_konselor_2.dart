import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:women_center_mobile/Models/konselor_model/konselor_model.dart';
import 'package:women_center_mobile/Models/utils/navigation_service.dart';
import 'package:women_center_mobile/View/booking/booking.dart';
import 'package:women_center_mobile/ViewModel/konselor_view_model/konselor_view_model.dart';

import '../../Models/utils/auth_service.dart';

class KonselingPilihanKonselor2 extends StatefulWidget {
  final int idPaket;
  const KonselingPilihanKonselor2({super.key, required this.idPaket});

  @override
  State<KonselingPilihanKonselor2> createState() =>
      _KonselingPilihanKonselor2State();
}

class _KonselingPilihanKonselor2State extends State<KonselingPilihanKonselor2> {
  List<KonselorModel> get counselorData =>
      context.watch<KonselorViewModel>().listKonselor;
  String get token => AuthService.token;

  // @override
  // void initState() {
  //   super.initState();
  //   fetchData(); // Panggil fungsi untuk memuat data ketika widget pertama kali dibuat
  // }

  @override
  Widget build(BuildContext context) {
    context.read<KonselorViewModel>().fetchAllKonselor();

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: counselorData.length,
      itemBuilder: (context, index) {
        final counselor = counselorData[index];
        return CardData(konselor: counselor, idPaket: widget.idPaket);
      },
    );
  }
}

class CardData extends StatelessWidget {
  final KonselorModel konselor;
  final int idPaket;

  const CardData({
    Key? key,
    required this.konselor,
    required this.idPaket,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          NavigationService.navigatorKey.currentContext ?? context,
          "/booking",
          arguments: BookingArgs(konselor: konselor, idPaket: idPaket),
        );
      },
      child: SizedBox(
        height: 160,
        child: Card(
          margin: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 110,
                  width: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(
                      konselor.profilePicture,
                      loadingBuilder: (context, child, progress) {
                        return progress == null
                            ? child
                            : const Center(child: CircularProgressIndicator());
                      },
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.error),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        konselor.firstName + konselor.lastName,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              konselor.status,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
