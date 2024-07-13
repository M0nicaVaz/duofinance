import 'package:duofinance/features/dashboard/dashboard_page.dart';
import 'package:duofinance/features/statistics/personal_page.dart';
import 'package:duofinance/features/settings/settings_page.dart';
import 'package:go_router/go_router.dart';

class CustomGoRoute extends GoRoute {
  final bool hideBottomNav;

  CustomGoRoute(
      {required super.path,
      this.hideBottomNav = false,
      super.routes,
      super.name,
      super.builder});
}

final List<GoRoute> privateRoutes = <GoRoute>[
  CustomGoRoute(
    name: 'Dashboard',
    path: '/',
    builder: (_, __) => const DashboardPage(),
  ),
  CustomGoRoute(
    name: 'Pessoal',
    path: '/classrooms',
    builder: (_, __) => const PersonalPage(),
  ),
  CustomGoRoute(
    name: 'Minha conta',
    path: '/account',
    builder: (_, __) => const SettingsPage(),
  ),
];

getRouteName(String path) {
  final int index = privateRoutes.indexWhere((GoRoute route) {
    return route.path == path;
  });

  return privateRoutes[index].name;
}
