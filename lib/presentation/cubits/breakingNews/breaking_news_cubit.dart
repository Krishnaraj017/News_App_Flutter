import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart ' as http;
import 'package:krish_news_app/data/models/news_model.dart';
import 'package:krish_news_app/presentation/cubits/breakingNews/breaking_news_state.dart';

class BreakingNewsCubit extends Cubit<BreakingNewsState> {
  BreakingNewsCubit() : super(BreakingNewsInitialState());
  // var apiKey = "9687754ab4ef41ecb4d2a542fb8f1308";
  // var url =
  //     "https://newsapi.org/v2/top-headlines?q=keyword&apiKey=9687754ab4ef41ecb4d2a542fb8f1308";
  Future<void> getBreakingNews(url) async {
    http.Response res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      NewsModel breakingNewsData = NewsModel.fromJson(jsonDecode(res.body));
      emit(BreakingNewsSuccessState(breakingNewsData.articles));
    }
  }
}
