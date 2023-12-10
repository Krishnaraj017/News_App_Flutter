import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krish_news_app/presentation/cubits/breakingNews/breaking_news_cubit.dart';
import 'package:krish_news_app/presentation/cubits/breakingNews/breaking_news_state.dart';

@RoutePage()
class BreakingNewsScreen extends StatefulWidget implements AutoRouteWrapper {
  const BreakingNewsScreen({super.key});

  @override
  State<BreakingNewsScreen> createState() => _BreakingNewsScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => BreakingNewsCubit(),
      child: this,
    );
  }
}

class _BreakingNewsScreenState extends State<BreakingNewsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BreakingNewsCubit, BreakingNewsState>(
        builder: (context, state) {
      if (state is BreakingNewsSuccessState) {
        return CarouselSlider(
          items: state.articles.map((article) {
            return Builder(
              builder: (BuildContext context) {
                return Banner(
                  location: BannerLocation.topStart,
                  message: 'Top Headlines',
                  child: InkWell(
                    onTap: () {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (_) => WebViewNews(newsUrl: article.url),
                      //   ),
                      // );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              article.urlToImage ?? "",
                              fit: BoxFit.fill,
                              height: double.infinity,
                              width: double.infinity,
                              errorBuilder: (BuildContext context,
                                  Object exception, StackTrace? stackTrace) {
                                return Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const SizedBox(
                                    height: 200,
                                    width: double.infinity,
                                    child: Icon(Icons.broken_image_outlined),
                                  ),
                                );
                              },
                            ),
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.black12.withOpacity(0),
                                    Colors.black,
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 5,
                                  vertical: 10,
                                ),
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child: Text(
                                    article.title,
                                    style: const TextStyle(
                                      fontSize:
                                          16, // Change to your desired font size
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }).toList(),
          options: CarouselOptions(
            autoPlay: true,
            height: 200,
            enlargeCenterPage: true,
          ),
        );
      }
      return Container();
    });
  }
}
