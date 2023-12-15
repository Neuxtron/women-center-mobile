import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:provider/provider.dart';
import 'package:women_center_mobile/Models/artikel_konselor_model/artikel_konselor_model.dart';
import 'package:women_center_mobile/Models/utils/auth_service.dart';

class ArtikelKonselorProvider extends ChangeNotifier {
  List<Article> _articles = [];
  dynamic _articlePublish = 0;
  dynamic _articleReview = 0;
  dynamic _articleReject = 0;

  List<Article> get articles => _articles;
  dynamic get articlePublish => _articlePublish;
  dynamic get articleReview => _articleReview;
  dynamic get articleReject => _articleReject;

  // get token jwt
  String get token => AuthService.token;

  Future<void> fetchArticles() async {
    final url =
        Uri.parse('https://api-ferminacare.tech/api/v1/counselor/articles');
    final headers = {
      'Authorization': 'Bearer $token',
    };
    try {
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final data = ArticleData.fromJson(responseData);

        _articles = data.articles;
        _articlePublish = data.articlePublish;
        _articleReview = data.articleReview;
        _articleReject = data.articleReject;

        notifyListeners();
      } else {
        print('Failed to fetch articles');
      }
    } catch (error) {
      print('Error fetching articles: $error');
    }
  }
}
