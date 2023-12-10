import 'dart:convert';

import 'package:krish_news_app/data/models/news_model.dart';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:krish_news_app/presentation/cubits/search_news/search_news_state.dart';

class SearchNewsCubit extends Cubit<SearchNewsState> {
  SearchNewsCubit() : super(SearchNewsInitialState());

  // Function to generate News API URL
  String? generateNewsApiUrl({
    String? category,
    String? country,
    String? channel,
  }) {
    final apiKey = "9687754ab4ef41ecb4d2a542fb8f1308";
    String baseUrl = "https://newsapi.org/v2/";

    if (category != null) {
      return "$baseUrl/top-headlines?category=$category&apiKey=$apiKey";
    } else if (country != null) {
      return "$baseUrl/everything?q=$country&sortBy=popularity&pageSize=10&apiKey=$apiKey";
    } else if (channel != null) {
      return "$baseUrl/top-headlines?sources=$channel&apiKey=$apiKey";
    } else {
      // Handle the case when no input is provided
      return null;
    }
  }

  Future<void> getSearchNewsFromApi({
    String? category,
    String? country,
    String? channel,
  }) async {
    // Generate the News API URL based on the provided parameters
    String? apiUrl = generateNewsApiUrl(
        category: category, country: country, channel: channel);

    if (apiUrl == null) {
      // Handle the case when no valid URL is generated
      return;
    }

      http.Response res = await http.get(Uri.parse(apiUrl));
      print(res.body);

      if (res.statusCode == 200) {
        NewsModel newsData = NewsModel.fromJson(jsonDecode(res.body));
        emit(SearchNewsSuccessState(newsData.articles));
      }
    
  }
}
