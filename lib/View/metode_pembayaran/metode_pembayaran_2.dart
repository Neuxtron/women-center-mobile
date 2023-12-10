import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:women_center_mobile/View/metode_pembayaran/pembayaran_widget_tabBar.dart';
// import 'package:women_center_mobile/View/metode_pembayaran/pembayaran_widget_tabBar.dart';

class Payment2 extends StatefulWidget {
  const Payment2({super.key});

  @override
  State<Payment2> createState() => _Payment2State();
}

class _Payment2State extends State<Payment2> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 249, 245, 246),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 253, 206, 223),
          title: Text('Pembayaran'),
          // bottom: TabBarPayment(), // Use TabBarPayment directly
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // PaymentWidget2(),
            // Text("AAAAAAAAAAAAAA"),
            Expanded(child: HomePage())
          ],
        ),
      ),
    );
  }
}
