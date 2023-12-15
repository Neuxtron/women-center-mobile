class Article {
  final int id;
  final String title;
  final String thumbnail;
  final String slug;
  final String status;
  final Map<String, dynamic> author;
  final String publishedAt;

  Article({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.slug,
    required this.status,
    required this.author,
    required this.publishedAt,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      title: json['title'],
      thumbnail: json['thumbnail'],
      slug: json['slug'],
      status: json['status'],
      author: json['author'],
      publishedAt: json['published_at'],
    );
  }
}

class ArticleData {
  final dynamic articlePublish;
  final dynamic articleReview;
  final dynamic articleReject;
  final List<Article> articles;

  ArticleData({
    required this.articlePublish,
    required this.articleReview,
    required this.articleReject,
    required this.articles,
  });

  factory ArticleData.fromJson(Map<String, dynamic> json) {
    var articleList = json['data']['lists'] as List<dynamic>;
    List<Article> articles =
        articleList.map((article) => Article.fromJson(article)).toList();

    return ArticleData(
      articlePublish: json['data']['article_publish'],
      articleReview: json['data']['article_review'],
      articleReject: json['data']['article_reject'],
      articles: articles,
    );
  }
}
