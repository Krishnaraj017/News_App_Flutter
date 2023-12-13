import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krish_news_app/presentation/cubits/search_news/search_news_cubit.dart';
import 'package:krish_news_app/presentation/cubits/search_news/search_news_state.dart';
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
        backgroundColor: Color(0x1B1B1B1B),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    width: 307,
                    height: 50,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          color: Colors.black.withOpacity(0.18000000715255737),
                        ),
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 17.0),
                      child: TextField(
                        controller: searchController,
                        onChanged: (input) {
                          context
                              .read<SearchNewsCubit>()
                              .getSearchNewsFromApi(category: input);
                          context
                              .read<SearchNewsCubit>()
                              .getSearchNewsFromApi(country: input);
                          context
                              .read<SearchNewsCubit>()
                              .getSearchNewsFromApi(channel: input);
                        },
                        decoration: const InputDecoration(
                          hintText: 'Search By Category',
                          border: InputBorder
                              .none, // Remove the border of the TextField
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 28,
                    height: 35,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Center(child: Stack(children: [Icon(Icons.search)])),
                  )
                ],
              ),
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
