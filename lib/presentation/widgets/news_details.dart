import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krish_news_app/data/models/article_model.dart';
import 'package:krish_news_app/presentation/cubits/news/news_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsWidget extends StatelessWidget {
  final ArticleModel article;

  const NewsDetailsWidget({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(
        title: Text(
          article.title,
          style: const TextStyle(fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Card(
            elevation: 7, // Set the elevation for a shadow effect
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (article.urlToImage != null)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Image.network(
                        article.urlToImage!,
                        height: 270,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  const SizedBox(height: 16),
                  Text(
                    'Author: ${article.author ?? "N/A"}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Published at: ${article.publishedAt}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Description: ${article.description ?? "N/A"} ',
                    maxLines: null,
                    overflow: TextOverflow.fade,
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Content: ${article.content ?? "N/A"}',
                    maxLines: null,
                    overflow: TextOverflow.fade,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Source: ${article.source.name ?? "N/A"}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () async {
                      final Uri uri = Uri.parse(article.url);
                      if (await canLaunchUrl(uri)) {
                        launchUrl(uri);
                      } else {
                        throw 'Could not launch $article.url';
                      }
                    },
                    child: Text(
                      'URL: ${article.url}',
                      style: const TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
