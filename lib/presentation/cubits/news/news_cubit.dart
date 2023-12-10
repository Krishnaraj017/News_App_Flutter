import 'dart:convert';

import 'package:krish_news_app/data/models/news_model.dart';
import 'package:krish_news_app/presentation/cubits/news/news_state.dart';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewInitialState());
  String category ='';

  // https://newsapi.org/v2/everything?q=keyword&apiKey=APIKEY

//  String apiKey = "9687754ab4ef41ecb4d2a542fb8f1308";
  Future<void> getAllNewFromApi(baseUrl) async {
    http.Response res = await http.get(Uri.parse(baseUrl));
    print(res.body);
 
    if (res.statusCode == 200) {
      NewsModel newsData = NewsModel.fromJson(jsonDecode(res.body));
      emit(NewsSuccessState(newsData.articles));
    }
  }
}
