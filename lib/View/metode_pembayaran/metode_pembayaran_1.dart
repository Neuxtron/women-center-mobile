import 'package:flutter/material.dart';
import 'package:women_center_mobile/Models/metodepembayaran_model/metodepembayaran1_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:women_center_mobile/Models/utils/navigation_service.dart';

class MetodePembayaran1 extends StatefulWidget {
  const MetodePembayaran1({super.key});

  @override
  State<MetodePembayaran1> createState() => _MetodePembayaran1State();
}

class _MetodePembayaran1State extends State<MetodePembayaran1> {
  int? selectedPaymentIndex;
  List<PaymentMethod> paymentMethods = [
    PaymentMethod(
      image: 'Assets/images/dana.png',
      name: 'Dana',
    ),
    PaymentMethod(
      image: 'Assets/images/gopay.png',
      name: 'Gopay',
    ),
    PaymentMethod(
      image: 'Assets/images/link.png',
      name: 'LinkAja',
    ),
    PaymentMethod(
      image: 'Assets/images/ovo.png',
      name: 'Ovo',
    ),
    PaymentMethod(
      image: 'Assets/images/qris.png',
      name: 'Qris',
    ),
    PaymentMethod(
      image: 'Assets/images/BSI.png',
      name: 'Bank Syariah Indonesia',
    ),
    PaymentMethod(
      image: 'Assets/images/mandiri.png',
      name: 'Bank Mandiri',
    ),
    PaymentMethod(
      image: 'Assets/images/BCA.png',
      name: 'Bank Central Asia',
    ),
    PaymentMethod(
      image: 'Assets/images/BRI.png',
      name: 'Bank Republik Indonesia',
    ),
    PaymentMethod(
      image: 'Assets/images/BNI.png',
      name: 'Bank Nasional Indonesia',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFDCEDF),
        toolbarHeight: 96,
        leading: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {},
          ),
        ),
        title: Center(
          child: Transform.translate(
            offset: Offset(0.0, 10.0), // Adjust the value to move the text down
            child: Text(
              'Metode Pembayaran',
              style: GoogleFonts.roboto(
                // Use the Google Fonts class
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          color: Color(0xFFF9F5F6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Detail Order',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Card(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // Set background color to white
                    border: Border.all(
                      color: Colors.pink, // Set border color to pink
                    ),
                    borderRadius:
                        BorderRadius.circular(8), // Set border radius if needed
                  ),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Booking Id',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text('0001'),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            'Nama',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text('Sherly Praweswari'),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            'Email',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            'sherlypraweswari@gmail.com',
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            'Paket Konsultasi',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            'Paket All in One',
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            'Psikolog',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            'Stenafie Russel, M.Psi. Psikolog',
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            'Jadwal Konsultasi',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Sesi 1: Senin. 2 Oktober 2023, Jam 09.00',
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            'Sesi 2: Senin. 9 Oktober 2023, Jam 15.00',
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            'Sesi 3: Jumat, 20 Oktober 2023. Jam 13.00',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Metode Pembayaran',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'E-Wallet',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  final paymentMethod = paymentMethods[index];

                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            selectedPaymentIndex = index;
                          });
                        },
                        child: Row(
                          children: [
                            Image.asset(
                              paymentMethod.image,
                              width: 40,
                              height: 32,
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  paymentMethod.name,
                                  // style: TextStyle(
                                  //   fontWeight: FontWeight.bold,
                                  // ),
                                ),
                              ),
                            ),
                            Radio(
                              value: index,
                              groupValue: selectedPaymentIndex,
                              onChanged: (value) {
                                setState(() {
                                  selectedPaymentIndex = value as int?;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Divider(), // Add a divider after each payment method row
                    ],
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Transfer Virtual Account',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  final paymentMethod = paymentMethods[index + 5];

                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            selectedPaymentIndex = index + 5;
                          });
                        },
                        child: Row(
                          children: [
                            Image.asset(
                              paymentMethod.image,
                              width: 70,
                              height: 50,
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  paymentMethod.name,
                                  // style: TextStyle(
                                  //   fontWeight: FontWeight.bold,
                                  // ),
                                ),
                              ),
                            ),
                            Radio(
                              value: index + 5,
                              groupValue: selectedPaymentIndex,
                              onChanged: (value) {
                                setState(() {
                                  selectedPaymentIndex = value as int?;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Divider(), // Add a divider after each payment method row
                    ],
                  );
                },
              ),
              SizedBox(height: 20),
              _buildTotalPayment(),
              SizedBox(height: 20),
              _buildCardTotalPayment(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTotalPayment() {
    return Container(
      // padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Total Pembayaran',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  'Harga Paket',
                  style: TextStyle(
                    fontSize: 14,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 16),
                child: Text(
                  'Rp850.000',
                  style: TextStyle(
                    fontSize: 14,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  'Potongan Harga',
                  style: TextStyle(
                    fontSize: 14,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 16),
                child: Text(
                  '-Rp100.000',
                  style: TextStyle(
                    fontSize: 14,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  'Total',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 16),
                child: Text(
                  'Rp750.000',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCardTotalPayment() {
    return Container(
      height: 80,
      width: 350,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16, top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Pembayaran',
                    style: TextStyle(
                      fontSize: 14,
                      // fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Rp750.000',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 16, bottom: 16),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    NavigationService.navigatorKey.currentContext ?? context,
                    "/pembayaran2",
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.pink,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  minimumSize:
                      Size(86, 40), // Set the width and height of the button
                ),
                child: Text(
                  'Bayar',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
