import 'package:news_app_clean_architecture/features/daily_news/domain/entities/article.dart';

class ArticleModel extends ArticleEntity {
  const ArticleModel(
    super.id,
    super.author,
    super.title,
    super.description,
    super.url,
    super.urlToImage,
    super.publishedAt,
    super.content,
  );

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      json[''] ?? '',
      json['author'] ?? '',
      json['title'] ?? '',
      json['description'] ?? '',
      json['url'] ?? '',
      json['urlToImage'] ?? '',
      json['publishedAt'] ?? '',
      json['content'] ?? '',
    );
  }
}
