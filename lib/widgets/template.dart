import 'package:duofinance/routes/private_routes.dart';
import 'package:duofinance/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Template extends StatefulWidget {
  final Widget child;
  final String path;

  const Template({
    required this.child,
    required this.path,
    super.key,
  });

  @override
  State<Template> createState() => _TemplateState();
}

class _TemplateState extends State<Template> {
  int currentPageIndex = 0;

  handleDestination(int index) {
    setState(() {
      currentPageIndex = index;
    });

    context.go(privateRoutes[index].path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(
        currentPageIndex: currentPageIndex,
        onDestinationSelected: handleDestination,
      ),
      body: SafeArea(child: widget.child),
    );
  }
}
