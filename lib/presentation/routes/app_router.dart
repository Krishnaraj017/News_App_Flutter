import 'package:auto_route/auto_route.dart';
import 'package:krish_news_app/presentation/screens/breaking_news_screen.dart';
import 'package:krish_news_app/presentation/screens/dual_screen.dart';
import 'package:krish_news_app/presentation/screens/onboarding/onboading_screen.dart';
import 'package:krish_news_app/presentation/screens/onboarding/onboarding_two_screen.dart';
import 'package:krish_news_app/presentation/screens/search_news_screen.dart';

import '../screens/all_news_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: AllNewsRoute.page, 
        ),
        AutoRoute(page: BreakingNewsRoute.page),
        AutoRoute(
          page: SearchNewsRoute.page, 
        ),
        AutoRoute(
          page: OnboardingRouteOne.page, initial: true
        ),
        AutoRoute(page: OnBoardingRouteTwo.page, ),
        AutoRoute(page: MyRoute.page,)
        // AutoRoute(page: ReminderRoute.page)
        // AutoRoute(page: Reminder.page)
      ];
}
