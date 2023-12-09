import 'package:flutter/material.dart';

class Booking extends StatelessWidget {
  const Booking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("Assets/images/booking.png"),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.only(top: 32, bottom: 10, left: 16, right: 16),
            child: Column(
              children: [
                Text("Stenafie Russel, M.Psi., Psikolog"),
                Text("Psikologi • Universitas Indonesia"),
                Row(
                  children: [
                    Image.asset('Assets/images/welcome.jpg',
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit.cover),
                    Text("@stefaniersl"),
                  ],
                ),
              ],
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

class _PsikologTabViewState extends State<PsikologTabView>
    with SingleTickerProviderStateMixin {
  final List<Tab> _tabs = [
    Tab(
      child: Text("Tentang Psikolog"),
    ),
    Tab(
      child: Text("Review"),
    ),
  ];
  final List<Widget> _views = [
    Center(
      child: Text("Tentang Psikolog"),
    ),
    Center(
      child: Text("Review"),
    ),
  ];
  late TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          tabs: _tabs,
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: _views,
          ),
        ),
      ],
    );
  }
}
