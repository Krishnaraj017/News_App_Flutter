import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:krish_news_app/data/models/article_model.dart';
import 'package:krish_news_app/presentation/cubits/news/news_cubit.dart';
import 'package:krish_news_app/presentation/cubits/news/news_state.dart';
import 'package:krish_news_app/presentation/widgets/news_details.dart';

@RoutePage()
class AllNewsScreen extends StatefulWidget implements AutoRouteWrapper {
  const AllNewsScreen({super.key});

  @override
  State<AllNewsScreen> createState() => _TestScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(),
      child: this,
    );
  }
}

class _TestScreenState extends State<AllNewsScreen> {
  String category = 'business';
  String searchKey = 'usa';
  String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  String channel = "Tv9";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    await context.read<NewsCubit>().getAllNewFromApi(
                          "https://newsapi.org/v2/everything?q=keyword&apiKey=9687754ab4ef41ecb4d2a542fb8f1308",

                          ///all news
                        );
                  } catch (e) {
                    print("Error fetching news: $e");
                  }
                },
                child: const Text("Press"),
              ),
            ),
            const SizedBox(height: 12),
            BlocBuilder<NewsCubit, NewsState>(
              builder: (context, state) {
                if (state is NewsLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is NewsSuccessState) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.articles.length,
                      itemBuilder: (context, index) {
                        final article = state.articles[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    NewsDetailsWidget(article: article),
                              ),
                            );
                          },
                          child: ListTile(
                            title: Text(article.title),
                            subtitle: Text("${article.source.name}"),
                          ),
                        );
                      },
                    ),
                  );
                } else if (state is NewsErrorState) {
                  return Center(
                    child: Text("Error: ${state.appError}"),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
