import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  final void Function(int) onDestinationSelected;
  final int currentPageIndex;

  const BottomNavBar(
      {required this.onDestinationSelected,
      required this.currentPageIndex,
      super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: widget.onDestinationSelected,
      indicatorColor: Colors.amber,
      selectedIndex: widget.currentPageIndex,
      destinations: const <Widget>[
        NavigationDestination(
          selectedIcon: Icon(Icons.home),
          icon: Icon(Icons.home_outlined),
          label: 'Dashboard',
        ),
        NavigationDestination(
          icon: Badge(child: Icon(Icons.notifications_sharp)),
          label: 'Pessoal',
        ),
        NavigationDestination(
          icon: Badge(
            label: Text('2'),
            child: Icon(Icons.messenger_sharp),
          ),
          label: 'Minha conta',
        ),
      ],
    );
  }
}
