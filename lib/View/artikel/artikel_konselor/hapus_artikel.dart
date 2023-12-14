import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ArticleListPage extends StatefulWidget {
  @override
  _ArticleListPageState createState() => _ArticleListPageState();
}

class _ArticleListPageState extends State<ArticleListPage> {
  late Future<List<Article>> futureArticles;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    futureArticles = fetchArticles();
  }

  Future<List<Article>> fetchArticles() async {
    final response = await http.get(
      Uri.parse('https://api-ferminacare.tech/api/v1/articles'),
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZnVsbF9uYW1lIjoicHV0cmlkaWFuYSIsImVtYWlsIjoicHV0cmlAZ21haWwuY29tIiwicm9sZSI6InVzZXIiLCJleHAiOjE3MDI0MTQwODZ9.KfauB8_ZBFmwvdLx5u3FDi0pS9QPoOI97fCCIDAOgCY',
      },
    );

    if (response.statusCode == 200) {
      List<Article> articles = [];
      final jsonData = json.decode(response.body);
      for (var item in jsonData['data']) {
        articles.add(Article.fromJson(item));
      }
      return articles;
    } else {
      throw Exception('Failed to load articles');
    }
  }

  Future<void> deleteArticle(int id) async {
    final response = await http.delete(
      Uri.parse('https://api-ferminacare.tech/api/v1/articles/$id'),
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZnVsbF9uYW1lIjoicHV0cmlkaWFuYSIsImVtYWlsIjoicHV0cmlAZ21haWwuY29tIiwicm9sZSI6InVzZXIiLCJleHAiOjE3MDI0MTQwODZ9.KfauB8_ZBFmwvdLx5u3FDi0pS9QPoOI97fCCIDAOgCY',
      },
    );

    if (response.statusCode == 200) {
      // Artikel berhasil dihapus, lakukan sesuatu (contoh: refresh data)
      setState(() {
        futureArticles = fetchArticles(); // Memuat ulang daftar artikel
      });
    } else {
      throw Exception('Failed to delete article');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Article List',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFFFDCEDF),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Search...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.white, width: 1.0),
                  gapPadding: 3.3,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.white, width: 1.0),
                  gapPadding: 3.3,
                ),
              ),
              onChanged: (value) {
                // Use value for search...
              },
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Article>>(
              future: futureArticles,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('${snapshot.error}'),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(
                    child: Text('No articles found'),
                  );
                }

                List<Article>? articles = snapshot.data;
                return ListView.builder(
                  itemCount: articles!.length,
                  itemBuilder: (context, index) {
                    return ArticleCard(
                      article: articles[index],
                      onDelete: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Delete Article?'),
                              content: Text(
                                  'Are you sure you want to delete this article?'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('No'),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    try {
                                      await deleteArticle(articles[index]
                                          .id); // Menghapus artikel
                                      Navigator.of(context).pop();
                                    } catch (e) {
                                      print(e.toString());
                                      // Tampilkan pesan kesalahan jika gagal menghapus
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content:
                                            Text('Failed to delete article'),
                                        backgroundColor: Colors.red,
                                      ));
                                    }
                                  },
                                  child: Text('Yes'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      onEdit: () {
                        // Add logic for editing article here
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

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

class ArticleCard extends StatelessWidget {
  final Article article;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const ArticleCard({
    required this.article,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 20, right: 20, top: 10),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                article.thumbnail,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 26),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10), // Sesuaikan dengan kebutuhan
                          child: Text(
                            article.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            onTap: onDelete,
                            child: Column(
                              children: [
                                Icon(Icons.delete, color: Colors.grey),
                                SizedBox(height: 4),
                                Text(
                                  'Delete',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 10),
                          InkWell(
                            onTap: onEdit,
                            child: Column(
                              children: [
                                Icon(Icons.edit, color: Colors.grey),
                                SizedBox(height: 4),
                                Text(
                                  'Edit',
                                  style: TextStyle(color: Colors.green),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
