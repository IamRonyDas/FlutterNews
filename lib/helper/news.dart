import 'dart:convert';
import 'package:news/module/article_module.dart';
import 'package:http/http.dart' as http;

class News {
  List<article_model> news = [];

  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=f2b58e9258e34ae6bb096a8a0711f5b1";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null&& element['title'] != null && element['content'] != null && element['url'] != null && element['author'] != null) {
          article_model articleModel = article_model(
            title: element['title'],
            author: element["author"],
            description: element["description"],
            url: element["url"],
            urltoimage: element["urlToImage"],
            content: element["content"],
          );
          news.add(articleModel);
        }
      });
    }
  }
}
//
class CategoryNews {
  List<article_model> news = [];

  Future<void> getNews(String category) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=f2b58e9258e34ae6bb096a8a0711f5b1";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null&& element['title'] != null && element['content'] != null && element['url'] != null && element['author'] != null) {
          article_model articleModel = article_model(
            title: element['title'],
            author: element["author"],
            description: element["description"],
            url: element["url"],
            urltoimage: element["urlToImage"],
            content: element["content"],
          );
          news.add(articleModel);
        }
      });
    }
  }
}

