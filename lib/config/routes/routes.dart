import 'package:duofinance/widgets/bottom_nav_bar.dart';
import 'package:duofinance/widgets/dialog.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import "package:duofinance/config/routes/private_routes.dart";
import "package:duofinance/config/routes/public_routes.dart";

class Routes {
  bool isLoggedIn;
  BuildContext context;

  static final ShellRoute _privateRoutes = ShellRoute(
      builder: (BuildContext context, GoRouterState state, Widget child) {
        // final bool hideBottomNav = !Breakpoints(context).isTabletOrMobile;

        return Scaffold(
            body: SafeArea(child: child),
            bottomNavigationBar: BottomNavBar(path: state.fullPath),
            floatingActionButton: FloatingActionButton(
              shape: const CircleBorder(),
              child: const Icon(Icons.add),
              onPressed: () => showAddDialog(context: context),
            ));
      },
      routes: privateRoutes);

  static final ShellRoute _publicRoutes = ShellRoute(
      builder: (_, __, Widget child) => Scaffold(body: child),
      routes: publicRoutes);

  GoRouter get router => GoRouter(
        initialLocation: "/",
        routes: isLoggedIn
            ? <RouteBase>[_privateRoutes]
            : <RouteBase>[_publicRoutes],
      );

  Routes(this.context, this.isLoggedIn);
}
