import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:job_tracker_fl/screens/jobs/job_detail.dart';
import 'package:job_tracker_fl/widgets/nested_navigation_scaffold.dart';
import 'package:job_tracker_fl/screens/dashboard/dashboard.dart';
import 'package:job_tracker_fl/screens/jobs/jobs.dart';
import 'package:job_tracker_fl/screens/more/more.dart';
import 'package:job_tracker_fl/screens/schedule/schedule.dart';

part 'router.g.dart';

@TypedStatefulShellRoute<AppShellRouteData>(branches: [
  TypedStatefulShellBranch(
    routes: [
      TypedGoRoute<DashboardScreenRoute>(path: '/'),
    ],
  ),
  TypedStatefulShellBranch(
    routes: [
      TypedGoRoute<ScheduleScreenRoute>(path: '/schedule'),
    ],
  ),
  TypedStatefulShellBranch(
    routes: [
      TypedGoRoute<JobsScreenRoute>(path: '/jobs', routes: [
        TypedGoRoute<JobDetailScreenRoute>(path: 'detail', name: 'job-detail'),
      ]),
    ],
  ),
  TypedStatefulShellBranch(
    routes: [
      TypedGoRoute<MoreScreenRoute>(path: '/more'),
    ],
  ),
])
class AppShellRouteData extends StatefulShellRouteData {
  @override
  Widget builder(BuildContext context, GoRouterState state,
      StatefulNavigationShell navigationShell) {
    return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
  }
}

class DashboardScreenRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const DashboardScreen();
  }
}

class ScheduleScreenRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ScheduleScreen();
  }
}

class JobsScreenRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const JobsScreen();
  }
}

class JobDetailScreenRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const JobDetailScreen();
  }
}

class MoreScreenRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const MoreScreen();
  }
}
