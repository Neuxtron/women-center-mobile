import 'package:intl/intl.dart';

class ArtikelModel {
  final int id;
  final String title;
  final String thumbnail;
  final String slug;
  final Author author;
  final String status;
  final DateTime publishedAt;
  final String? content;
  // final List<Comment> comments; // TODO: uncomment
  List<Comment> comments; // TODO: dihapus atau uncomment

  ArtikelModel({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.slug,
    required this.author,
    required this.status,
    required this.publishedAt,
    required this.content,
    required this.comments,
  });

  String formatJam() {
    final jarakWaktu = DateTime.now().difference(publishedAt);
    return "${jarakWaktu.inHours} jam yang lalu";
  }

  factory ArtikelModel.fromJson(Map<String, dynamic> json) {
    return ArtikelModel(
      id: json["id"],
      title: json["title"],
      thumbnail: json["thumbnail"],
      slug: json["slug"],
      author: Author.fromJson(json["author"]),
      status: json["status"],
      publishedAt:
          DateFormat("dd MMM yyyy hh:mm:ss").parse(json["published_at"]),
      content: json["content"],
      comments: Comment.fromListJson(json["comments"] ?? []),
    );
  }
}

class Author {
  final String name;
  final String role;

  Author({
    required this.name,
    required this.role,
  });

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      name: json["name"],
      role: json["role"],
    );
  }
}

class Comment {
  final Author author;
  final String content;
  final int likes;
  final List<Comment> replies;
  final DateTime publishedAt;

  Comment({
    required this.author,
    required this.content,
    required this.likes,
    required this.replies,
    required this.publishedAt,
  });

  String formatJam() {
    final jarakWaktu = DateTime.now().difference(publishedAt);
    return "${jarakWaktu.inHours}h";
  }

  static List<Comment> fromListJson(List listJson) {
    return listJson.map((e) => Comment.fromJson(e)).toList();
  }

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      author: Author.fromJson(json["author"]),
      content: json["content"],
      likes: json["likes"],
      replies: fromListJson(json["replies"]),
      publishedAt:
          DateFormat("dd MMM yyyy hh:mm:ss").parse(json["published_at"]),
    );
  }
}
