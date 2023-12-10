import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krish_news_app/presentation/cubits/news/news_cubit.dart';
import 'package:krish_news_app/presentation/routes/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return
        // MultiBlocProvider(
        //   providers: [
        //     BlocProvider<NewsCubit>(
        //       create: (context) => NewsCubit(),
        //     )
        //   ],
        //   child:
        MaterialApp.router(
      routerConfig: _appRouter.config(),
    );
  }
}
