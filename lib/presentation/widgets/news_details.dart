import 'package:flutter/material.dart';
import 'package:krish_news_app/data/models/article_model.dart';

class NewsDetailsWidget extends StatelessWidget {
  final ArticleModel article;

  const NewsDetailsWidget({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (article.urlToImage != null)
                Image.network(article.urlToImage!,
                    height: 200, width: double.infinity, fit: BoxFit.cover),
              const SizedBox(height: 16),
              Text(
                'Author: ${article.author ?? "N/A"}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Published at: ${article.publishedAt}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Description: ${article.description ?? "N/A"}',
              ),
              const SizedBox(height: 8),
              Text(
                'Content: ${article.content ?? "N/A"}',
              ),
              const SizedBox(height: 8),
              Text(
                'Source: ${article.source.name ?? "N/A"}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'URL: ${article.url}',
                style: const TextStyle(color: Colors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
