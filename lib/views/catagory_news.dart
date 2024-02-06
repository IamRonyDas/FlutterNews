import 'package:flutter/material.dart';
import 'package:news/module/article_module.dart';
import 'package:showcaseview/showcaseview.dart';

import '../helper/news.dart';
import 'article_news.dart';

class catagory extends StatefulWidget {
  final String cati;
  catagory({required this.cati});
  @override
  State<catagory> createState() => _catagoryState();
}

class _catagoryState extends State<catagory> {
  List<article_model> articleModel = [];
  late List<article_model> filteredArticles;

  bool loading = true;
  void initState() {
    // TODO: implement initState
    super.initState();
    getcatagory();
  }

  Future<void> getcatagory() async {
    CategoryNews news = CategoryNews();
    await news.getNews(widget.cati);
    articleModel = news.news.toList();
    filteredArticles = news.news.toList();
    setState(() {
      loading = false;
    });
  }

  searchArticles(String query) {
    List<article_model> temp = articleModel
        .where((article) =>
            article.content.toLowerCase().contains(query.toLowerCase()) ||
            article.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    filteredArticles = temp;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Flutter'),
                Text(
                  'News',
                  style: TextStyle(color: Colors.blue[400]),
                ),
              ],
            ),
            // Add TextField here
            Container(
              width: 150, // Adjust width as needed
              child: TextField(
                onChanged: (value) {
                  searchArticles(value);
                },
                decoration: InputDecoration(
                    hintText: 'Search...',
                    hintStyle: TextStyle(color: Colors.black),
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search)),
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 16),
                      child: ListView.builder(
                        itemCount: filteredArticles.length,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return BlogTile(
                            imageUrl: filteredArticles[index].urltoimage,
                            title: filteredArticles[index].title,
                            desc: filteredArticles[index].description,
                            url: filteredArticles[index].url,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageUrl, title, desc, url;
  BlogTile({
    required this.imageUrl,
    required this.title,
    required this.desc,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => article(
              blogUrl: url,
              imageUrl: '',
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration:
              BoxDecoration(color: Color.fromRGBO(255, 255, 255, 0.553)),
          margin: EdgeInsets.only(bottom: 16),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(imageUrl),
              ),
              SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                desc,
                style: TextStyle(color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
