import 'package:news_app_clean_architecture/core/resources/data_state.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/entities/article.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/repostitory/article_repository.dart';
import 'package:news_app_clean_architecture/core/usecase/usecase.dart';

class GetArticleUseCase
    implements UseCase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepositoy _articleRepositoy;

  GetArticleUseCase(this._articleRepositoy);
  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepositoy.getNewsArticles();
  }
}
