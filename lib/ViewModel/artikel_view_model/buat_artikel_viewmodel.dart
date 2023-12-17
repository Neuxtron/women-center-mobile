import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:women_center_mobile/Models/artikel_model/buat_artikel_model.dart';
import 'package:http_parser/http_parser.dart';
import '../../Models/utils/auth_service.dart';

class CreateArticleViewModel extends ChangeNotifier {
  String get token => AuthService.token;
  Future<void> createArticle(Article article, String accessToken) async {
    try {
      final Uri uri = Uri.parse('https://api-ferminacare.tech/api/v1/counselor/articles');

      // Membuat objek MultipartRequest
      final http.MultipartRequest request = http.MultipartRequest('POST', uri)
        ..headers['Authorization'] = 'Bearer $token'
        ..files.add(await http.MultipartFile.fromPath(
          'thumbnail',
          article.thumbnail, // Path gambar yang dipilih
          contentType: MediaType('image', 'jpeg'),
        ))
        ..fields['title'] = article.title
        ..fields['content'] = article.content;

      // Mengirim permintaan dan mendapatkan respons
      final http.Response response = await http.Response.fromStream(await request.send());

      if (response.statusCode == 201) {
        // Artikel berhasil dibuat
        print('Article created successfully!');
      } else {
        // Artikel gagal dibuat
        print('Failed to create article. Status code: ${response.statusCode}, Response: ${response.body}');
      }
    } catch (error) {
      // Handle error jika ada kesalahan selama proses HTTP
      print('Error creating article: $error');
    }
  }
}
