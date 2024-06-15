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
      backgroundColor: Colors.grey[900],
      onDestinationSelected: onDestinationSelected,
      indicatorColor: Colors.cyan[400],
      selectedIndex: currentPageIndex,
      destinations: const <Widget>[
        NavigationDestination(
          selectedIcon: Icon(Icons.grid_view_sharp),
          icon: Icon(Icons.grid_view),
          label: 'Dashboard',
        ),
        NavigationDestination(
          icon: Icon(Icons.bar_chart),
          selectedIcon: Icon(Icons.bar_chart_rounded),
          label: 'Estatísticas',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.person_2),
          icon: Icon(Icons.person_2_outlined),
          label: 'Minha conta',
        ),
      ],
    );
  }
}
