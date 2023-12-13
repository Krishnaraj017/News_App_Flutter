import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krish_news_app/presentation/cubits/news/news_cubit.dart';
import 'package:krish_news_app/presentation/cubits/news/news_state.dart';
import 'package:krish_news_app/presentation/routes/app_router.dart';
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
 
  @override
  Widget build(BuildContext context) {
    // Automatically fetch news when the widget is built
    context.read<NewsCubit>().getAllNewFromApi(
          "https://newsapi.org/v2/everything?q=keyword&apiKey=9687754ab4ef41ecb4d2a542fb8f1308",
        );

    return PopScope(
      canPop: false,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0x1B1B1B1B),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  width: 400,
                  height: 50,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 96, 95, 162),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(children: [
                    const SizedBox(
                      width: 17,
                    ),
                    const SizedBox(
                      width: 120,
                      // height: 25,
                      child: Text(
                        'Newsy',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w700,
                          height: 0.02,
                          letterSpacing: -0.41,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                          context.router.replace(const SearchNewsRoute());
                        },
                        child: const Text(
                          'Search News=>',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        )),
                    GestureDetector(
                      onTap: () {
                        context.router.push(const SearchNewsRoute());
                      },
                      child: Container(
                        width: 25,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(),
                        child: const Stack(children: [
                          Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ]),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 25,
                      height: 25,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(),
                      child: const Stack(children: [
                        Icon(
                          Icons.notification_add,
                          color: Colors.white,
                        )
                      ]),
                    ),
                  ]),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left:20.0,top: 20),
                child: Row(children: [
                  Text(
                    'Latest News For You',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'New York Small',
                      fontWeight: FontWeight.w700,
                      height: 0.06,
                    ),
                  ),
                ]),
              ),
              const SizedBox(height: 16),
              BlocConsumer<NewsCubit, NewsState>(
                listener: (context, state) {
                  // Handle any state changes if needed
                  if (state is NewsSuccessState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "News fetched Successfully!",
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                    );
                  }
                },
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
                            child: Card(
                              elevation: 3,
                              color: const Color.fromARGB(255, 230, 233, 237),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  35.0,
                                ), // Adjust the corner radius
                              ),
                              child: ListTile(
                                title: Text(article.title),
                                subtitle: Text("${article.source.name}"),
                              ),
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
      ),
    );
  }
}
