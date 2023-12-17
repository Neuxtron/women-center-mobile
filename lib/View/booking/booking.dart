import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:women_center_mobile/Models/konselor_model/konselor_model.dart';
import 'package:women_center_mobile/View/booking/tabs/review.dart';
import 'package:women_center_mobile/View/booking/tabs/tentang_psikolog.dart';
import 'package:women_center_mobile/ViewModel/konselor_view_model/konselor_view_model.dart';

class BookingArgs {
  final KonselorModel konselor;
  final int idPaket;

  BookingArgs({
    required this.konselor,
    required this.idPaket,
  });
}

class Booking extends StatefulWidget {
  const Booking({super.key});

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  late BookingArgs _args;
  List<int> _schedule = [];

  void fetchSchedule() async {
    final schedule = await context
            .read<KonselorViewModel>()
            .fetchSchedule(_args.konselor.id) ??
        [];
    setState(() {
      _schedule = schedule;
    });
  }

  @override
  Widget build(BuildContext context) {
    _args = ModalRoute.of(context)!.settings.arguments as BookingArgs;
    fetchSchedule();

    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            _args.konselor.profilePicture,
            width: double.infinity,
            fit: BoxFit.contain,
          ),
          SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF9F5F6),
                borderRadius: BorderRadius.circular(32),
              ),
              padding: const EdgeInsets.only(
                  top: 32, bottom: 10, left: 16, right: 16),
              margin: const EdgeInsets.only(top: 433),
              child: Column(
                children: [
                  Text(_args.konselor.firstName + _args.konselor.lastName),
                  Text(_args.konselor.education),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'Assets/images/ig_icon.png',
                        width: 20,
                      ),
                      const Text("@stefaniersl"),
                    ],
                  ),
                  PsikologTabView(
                    description: _args.konselor.description,
                    schedule: _schedule,
                    konselorId: _args.konselor.id,
                    paketId: _args.idPaket,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PsikologTabView extends StatefulWidget {
  final String description;
  final List<int> schedule;
  final int konselorId;
  final int paketId;

  const PsikologTabView({
    super.key,
    required this.description,
    required this.schedule, required this.konselorId, required this.paketId,
  });

  @override
  State<PsikologTabView> createState() => _PsikologTabViewState();
}

class _PsikologTabViewState extends State<PsikologTabView> {
  final List<Tab> _tabs = [
    const Tab(
      child: Text("Tentang Psikolog"),
    ),
    const Tab(
      child: Text("Review"),
    ),
  ];
  List<Widget> get _views => [
        TentangPsikolog(
          description: widget.description,
          schedule: widget.schedule,
          konselorId: widget.konselorId,
          paketId: widget.paketId,
        ),
        const Review(),
      ];

  int _selectedIndex = 0;

  void changeViews(index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: _tabs.length,
          child: TabBar(
            tabs: _tabs,
            onTap: changeViews,
          ),
        ),
        _views[_selectedIndex],
      ],
    );
  }
}
