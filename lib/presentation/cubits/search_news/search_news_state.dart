import 'package:equatable/equatable.dart';
import 'package:krish_news_app/data/models/article_model.dart';
import 'package:krish_news_app/domain/app_error.dart';

abstract class SearchNewsState extends Equatable {
  const SearchNewsState();
}

class SearchNewsInitialState extends SearchNewsState {
  @override
  List<Object?> get props => [];
}

class SearchNewsLoadingState extends SearchNewsState {
  @override
  List<Object?> get props => [];
}

class SearchNewsSuccessState extends SearchNewsState {
  final List<ArticleModel> articles;
  const SearchNewsSuccessState(this.articles);
  @override
  List<Object?> get props => [articles];
}

class SearchNewsErrorState extends SearchNewsState {
  final AppError appError;
  const SearchNewsErrorState(this.appError);
  @override
  List<Object?> get props => [appError];
}
