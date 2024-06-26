// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $appShellRouteData,
    ];

RouteBase get $appShellRouteData => StatefulShellRouteData.$route(
      factory: $AppShellRouteDataExtension._fromState,
      branches: [
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/',
              factory: $DashboardScreenRouteExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/schedule',
              factory: $ScheduleScreenRouteExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/jobs',
              factory: $JobsScreenRouteExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'detail',
                  name: 'job-detail',
                  factory: $JobDetailScreenRouteExtension._fromState,
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/more',
              factory: $MoreScreenRouteExtension._fromState,
            ),
          ],
        ),
      ],
    );

extension $AppShellRouteDataExtension on AppShellRouteData {
  static AppShellRouteData _fromState(GoRouterState state) =>
      AppShellRouteData();
}

extension $DashboardScreenRouteExtension on DashboardScreenRoute {
  static DashboardScreenRoute _fromState(GoRouterState state) =>
      DashboardScreenRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ScheduleScreenRouteExtension on ScheduleScreenRoute {
  static ScheduleScreenRoute _fromState(GoRouterState state) =>
      ScheduleScreenRoute();

  String get location => GoRouteData.$location(
        '/schedule',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $JobsScreenRouteExtension on JobsScreenRoute {
  static JobsScreenRoute _fromState(GoRouterState state) => JobsScreenRoute();

  String get location => GoRouteData.$location(
        '/jobs',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $JobDetailScreenRouteExtension on JobDetailScreenRoute {
  static JobDetailScreenRoute _fromState(GoRouterState state) =>
      JobDetailScreenRoute();

  String get location => GoRouteData.$location(
        '/jobs/detail',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $MoreScreenRouteExtension on MoreScreenRoute {
  static MoreScreenRoute _fromState(GoRouterState state) => MoreScreenRoute();

  String get location => GoRouteData.$location(
        '/more',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
