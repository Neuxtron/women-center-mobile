class Article {
  final String title;
  final String content;
  final String thumbnail;

  Article({
    required this.title,
    required this.content,
    required this.thumbnail,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': content,
      'thumbnail': thumbnail,
    };
  }
}
