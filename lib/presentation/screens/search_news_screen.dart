import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krish_news_app/data/models/article_model.dart';
import 'package:krish_news_app/presentation/cubits/search_news/search_news_cubit.dart';
import 'package:krish_news_app/presentation/cubits/search_news/search_news_state.dart';
import 'package:krish_news_app/presentation/screens/all_news_screen.dart';
import 'package:krish_news_app/presentation/widgets/news_details.dart';

@RoutePage()
class SearchNewsScreen extends StatefulWidget implements AutoRouteWrapper {
  const SearchNewsScreen({super.key});

  @override
  State<SearchNewsScreen> createState() => _SearchNewsScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchNewsCubit(),
      child: this,
    );
  }
}

class _SearchNewsScreenState extends State<SearchNewsScreen> {
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Enter category, country, or channel',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  await context.read<SearchNewsCubit>().getSearchNewsFromApi(
                        category: searchController.text,
                      );
                } catch (e) {
                  print("Error fetching news: $e");
                }
              },
              child: const Text("Search"),
            ),
            const SizedBox(height: 12),
            BlocBuilder<SearchNewsCubit, SearchNewsState>(
              builder: (context, state) {
                if (state is SearchNewsLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is SearchNewsSuccessState) {
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
                } else if (state is SearchNewsErrorState) {
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
