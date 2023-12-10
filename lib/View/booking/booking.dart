import 'package:flutter/material.dart';
import 'package:women_center_mobile/View/booking/tabs/review.dart';
import 'package:women_center_mobile/View/booking/tabs/tentang_psikolog.dart';

class Booking extends StatelessWidget {
  const Booking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("Assets/images/booking.png"),
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
                  const Text("Stenafie Russel, M.Psi., Psikolog"),
                  const Text("Psikologi • Universitas Indonesia"),
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
                  const PsikologTabView(),
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
  const PsikologTabView({super.key});

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
  final List<Widget> _views = [
    const TentangPsikolog(),
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
