import 'package:duofinance/widgets/template.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import "package:duofinance/routes/private_routes.dart";
import "package:duofinance/routes/public_routes.dart";

class Routes {
  final bool isLoggedIn = true;
  BuildContext context;

  static final ShellRoute _privateRoutes = ShellRoute(
      builder: (_, GoRouterState state, Widget child) {
        return (Template(
          path: state.fullPath ?? "",
          child: child,
        ));
      },
      routes: privateRoutes);

  static final ShellRoute _publicRoutes = ShellRoute(routes: publicRoutes);

  GoRouter get router => GoRouter(
        initialLocation: "/",
        routes: isLoggedIn
            ? <RouteBase>[_privateRoutes]
            : <RouteBase>[_publicRoutes],
      );

  Routes(this.context);
}
