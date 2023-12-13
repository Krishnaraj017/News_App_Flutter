// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AllNewsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const AllNewsScreen()),
      );
    },
    BreakingNewsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const BreakingNewsScreen()),
      );
    },
    OnBoardingRouteTwo.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnBoardingScreenTwo(),
      );
    },
    OnboardingRouteOne.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingScreenOne(),
      );
    },
    SearchNewsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const SearchNewsScreen()),
      );
    },
  };
}

/// generated route for
/// [AllNewsScreen]
class AllNewsRoute extends PageRouteInfo<void> {
  const AllNewsRoute({List<PageRouteInfo>? children})
      : super(
          AllNewsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AllNewsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BreakingNewsScreen]
class BreakingNewsRoute extends PageRouteInfo<void> {
  const BreakingNewsRoute({List<PageRouteInfo>? children})
      : super(
          BreakingNewsRoute.name,
          initialChildren: children,
        );

  static const String name = 'BreakingNewsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnBoardingScreenTwo]
class OnBoardingRouteTwo extends PageRouteInfo<void> {
  const OnBoardingRouteTwo({List<PageRouteInfo>? children})
      : super(
          OnBoardingRouteTwo.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingRouteTwo';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnboardingScreenOne]
class OnboardingRouteOne extends PageRouteInfo<void> {
  const OnboardingRouteOne({List<PageRouteInfo>? children})
      : super(
          OnboardingRouteOne.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRouteOne';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SearchNewsScreen]
class SearchNewsRoute extends PageRouteInfo<void> {
  const SearchNewsRoute({List<PageRouteInfo>? children})
      : super(
          SearchNewsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchNewsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
