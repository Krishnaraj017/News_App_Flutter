import 'dart:convert';

import 'package:krish_news_app/data/models/news_model.dart';
import 'package:krish_news_app/presentation/cubits/news_state.dart';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewInitialState());
  Future<void> getAllNewFromApi(url) async {
    http.Response res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      NewsModel newsData = NewsModel.fromJson(jsonDecode(res.body));
      
    }
  }
}
