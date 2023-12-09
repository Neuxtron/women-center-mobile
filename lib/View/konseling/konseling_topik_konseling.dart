// //PUNYA DANIA

// import 'package:flutter/material.dart';

// // class konseling_topik_konseling extends StatelessWidget {
// //   const konseling_topik_konseling({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return const Placeholder();
// //   }
// // }

// class konseling_topik_konseling extends StatelessWidget {
//   @override
//   _konseling_topik_konseling createState() => _konseling_topik_konseling();
// }


// class _konseling_topik_konseling extends State<konseling_topik_konseling> {
//   List<String> selectedTopics = [];
//   List<String> konselingTopics = [
//     'Trauma',
//     'Depresi',
//     'Kekerasan Fisik/Seksual',
//     'Hubungan',
//     'Karir',
//     'Phobia',
//     'Pernikahan',
//     'Keluarga',
//     'Anak & Remaja',
//     'Gangguan Kepribadian',
//     'Perilaku',
//     'Perkembangan Diri',
//     'Masalah Diri',
//     'Kecemasan',
//     'Konflik Keluarga',
//     // Tambahkan topik konseling lainnya di sini
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Pilih Topik Konseling'),
//       ),
//       body: ListView.builder(
//         itemCount: konselingTopics.length,
//         itemBuilder: (context, index) {
//           return CheckboxListTile(
//             title: Text(konselingTopics[index]),
//             value: selectedTopics.contains(konselingTopics[index]),
//             onChanged: (bool value) {
//               setState(() {
//                 if (value) {
//                   selectedTopics.add(konselingTopics[index]);
//                 } else {
//                   selectedTopics.remove(konselingTopics[index]);
//                 }
//               });
//             },
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Lakukan sesuatu dengan topik konseling yang dipilih, contohnya:
//           print('Topik yang dipilih: $selectedTopics');
//         },
//         child: Icon(Icons.check),
//       ),
//       );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: KonselingTopics(),
//   ));
// }