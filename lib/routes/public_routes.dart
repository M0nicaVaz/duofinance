import 'package:duofinance/pages/sign_in_page.dart';
import 'package:go_router/go_router.dart';

final List<GoRoute> publicRoutes = <GoRoute>[
  GoRoute(name: 'sign_in', path: '/', builder: (_, __) => const SignInPage()),
];
