import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Review extends StatelessWidget {
  const Review({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> listReview = [
      {
        "name": "Rahma",
        "date": DateTime.parse("2023-10-20"),
        "content":
            "Konselor sangat membantu kami. Kami menyukainya\nSehat-sehat semua konselor.",
      },
      {
        "name": "Rahma",
        "date": DateTime.parse("2023-10-20"),
        "content":
            "Konselor sangat membantu kami. Kami menyukainya\nSehat-sehat semua konselor.",
      },
      {
        "name": "Rahma",
        "date": DateTime.parse("2023-10-20"),
        "content":
            "Konselor sangat membantu kami. Kami menyukainya\nSehat-sehat semua konselor.",
      },
    ];

    return Column(
      children: [
        Text("${listReview.length} review"),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: listReview.length,
          itemBuilder: (context, index) {
            return ReviewItem(review: listReview[index]);
          },
        ),
      ],
    );
  }
}

class ReviewItem extends StatelessWidget {
  final Map<String, dynamic> review;
  const ReviewItem({super.key, required this.review});

  String get _formattedDate => DateFormat("d MMMM yyyy").format(review["date"]);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://akcdn.detik.net.id/visual/2015/01/06/3145081d-6a92-4c32-a8d6-065203f5097c_169.jpg?w=400&q=90"),
              ),
              Column(
                children: [
                  Text(
                    review["name"],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    _formattedDate,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              Icon(Icons.star, color: Colors.yellow),
              Icon(Icons.star, color: Colors.yellow),
              Icon(Icons.star, color: Colors.yellow),
              Icon(Icons.star, color: Colors.yellow),
              Icon(Icons.star, color: Colors.yellow),
            ],
          ),
          Text(review["content"]),
        ],
      ),
    );
  }
}
