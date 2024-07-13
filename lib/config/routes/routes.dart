import 'package:duofinance/config/breakpoints.dart';
import 'package:duofinance/widgets/bottom_nav_bar.dart';
import 'package:duofinance/widgets/dialog.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import "package:duofinance/config/routes/private_routes.dart";
import "package:duofinance/config/routes/public_routes.dart";

class Routes {
  final bool isLoggedIn = true;
  BuildContext context;

  static final ShellRoute _privateRoutes = ShellRoute(
      builder: (BuildContext context, GoRouterState state, Widget child) {
        final bool hideBottomNav = !Breakpoints(context).isTabletOrMobile;

        return Scaffold(
            body: SafeArea(child: child),
            bottomNavigationBar:
                hideBottomNav ? null : BottomNavBar(path: state.fullPath),
            floatingActionButton: FloatingActionButton(
              shape: const CircleBorder(),
              child: const Icon(Icons.add),
              onPressed: () => showAddDialog(context: context),
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
