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
    ReminderRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ReminderScreen(),
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
/// [ReminderScreen]
class ReminderRoute extends PageRouteInfo<void> {
  const ReminderRoute({List<PageRouteInfo>? children})
      : super(
          ReminderRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReminderRoute';

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
