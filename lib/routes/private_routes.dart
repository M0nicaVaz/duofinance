import 'package:duofinance/features/dashboard/dashboard_page.dart';
import 'package:duofinance/features/statistics/personal_page.dart';
import 'package:duofinance/features/settings/settings_page.dart';
import 'package:go_router/go_router.dart';

final List<GoRoute> privateRoutes = <GoRoute>[
  GoRoute(
    name: 'Dashboard',
    path: '/',
    builder: (_, __) => const DashboardPage(),
  ),
  GoRoute(
    name: 'Pessoal',
    path: '/classrooms',
    builder: (_, __) => const PersonalPage(),
  ),
  GoRoute(
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
