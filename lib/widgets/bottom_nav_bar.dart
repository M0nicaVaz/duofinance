import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final void Function(int) onDestinationSelected;
  final int currentPageIndex;

  const BottomNavBar({
    required this.onDestinationSelected,
    required this.currentPageIndex,
    super.key,
  });

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
      onDestinationSelected: onDestinationSelected,
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
          label: 'Estatísticas',
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
