import 'package:equatable/equatable.dart';
import 'package:krish_news_app/data/models/article_model.dart';
import 'package:krish_news_app/domain/app_error.dart';

abstract class BreakingNewsState extends Equatable {
  const BreakingNewsState();
}

class BreakingNewsInitialState extends BreakingNewsState {
  @override
  List<Object?> get props => [];
}

class BreakingNewsLoadingState extends BreakingNewsState {
  @override
  List<Object?> get props => [];
}

class BreakingNewsSuccessState extends BreakingNewsState {
  final List<ArticleModel> articles;
  const BreakingNewsSuccessState(this.articles);
  @override
  List<Object?> get props => [articles];
}

class BreaNewsErrorState extends BreakingNewsState {
  final AppError appError;
  const BreaNewsErrorState(this.appError);
  @override
  List<Object?> get props => [appError];
}
