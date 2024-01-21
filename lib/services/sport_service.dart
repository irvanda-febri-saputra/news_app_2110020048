import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app_2110020048/models/article_model.dart';

class ApiService {
  final endPointUrl = "newsapi.org";

  Future<List<Article>> getArticle() async {
    final queryParameters = {
      'country': 'id',
      'category': 'sports',
      'apiKey': '4b0243ed633b4504bafc76a602a0e927'
    };

    final uri = Uri.https(endPointUrl, '/v2/top-headlines', queryParameters);
    final response = await http.get(uri);

    Map<String, dynamic> json = jsonDecode(response.body);

    List<dynamic> body = json['articles'];

    List<Article> articles =
        body.map((dynamic item) => Article.fromJson(item)).toList();

    return articles;
  }
}
