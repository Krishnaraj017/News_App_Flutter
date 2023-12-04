import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:krish_news_app/data/models/news_model.dart';
import 'package:krish_news_app/domain/app_error.dart';

@freezed
abstract class NewsState extends Equatable {
  const NewsState();
}

class NewInitialState extends NewsState {
  @override
  List<Object?> get props => [];
}

class NewsLoadingState extends NewsState {
  @override
  List<Object?> get props => [];
}

class NewsSuccessState extends NewsState {
  final NewsModel newsModel;
  const NewsSuccessState(this.newsModel);
  @override
  List<Object?> get props => [];
}

class NewsErrorState extends NewsState {
  final AppError appError;
  const NewsErrorState(this.appError);
  @override
  List<Object?> get props => [appError];
}
