import 'package:auto_route/auto_route.dart';
import 'package:krish_news_app/presentation/screens/breaking_news_screen.dart';
import 'package:krish_news_app/presentation/screens/reminder_screen.dart';
import 'package:krish_news_app/presentation/screens/search_news_screen.dart';

import '../screens/all_news_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: AllNewsRoute.page, initial: true),
        AutoRoute(page: BreakingNewsRoute.page),
        AutoRoute(page: SearchNewsRoute.page, ),
       // AutoRoute(page: Reminder.page)
      ];
}
 