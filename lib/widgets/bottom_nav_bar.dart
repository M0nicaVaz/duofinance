import 'package:duofinance/config/routes/go_extension.dart';
import 'package:duofinance/config/routes/private_routes.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    required this.path,
    super.key,
  });

  final String? path;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentPageIndex = 0;

  handleDestination(int index) {
    setState(() {
      currentPageIndex = index;
    });

    context.goPush(privateRoutes[index].path);
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      indicatorShape: const ContinuousRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.0),
          topRight: Radius.circular(8.0),
        ),
      ),
      backgroundColor: Colors.grey[900],
      onDestinationSelected: handleDestination,
      indicatorColor: Colors.grey[850],
      selectedIndex: currentPageIndex,
      destinations: const <Widget>[
        NavigationDestination(
          selectedIcon: Icon(
            Icons.grid_view_sharp,
            color: Colors.cyanAccent,
          ),
          icon: Icon(
            Icons.grid_view,
          ),
          label: 'Dashboard',
        ),
        NavigationDestination(
          icon: Icon(Icons.bar_chart),
          selectedIcon: Icon(
            Icons.bar_chart_rounded,
            color: Colors.cyanAccent,
          ),
          label: 'Histórico',
        ),
        NavigationDestination(
          selectedIcon: Icon(
            Icons.person_2,
            color: Colors.cyanAccent,
          ),
          icon: Icon(
            Icons.person_2_outlined,
          ),
          label: 'Minha conta',
        ),
      ],
    );
  }
}
