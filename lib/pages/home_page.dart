import 'package:duofinance/pages/dashboard_page.dart';
import 'package:duofinance/pages/personal_page.dart';
import 'package:duofinance/pages/settings_page.dart';
import 'package:duofinance/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;

  handleDestination(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Duo Finance"),
      ),
      bottomNavigationBar: BottomNavBar(
        currentPageIndex: currentPageIndex,
        onDestinationSelected: handleDestination,
      ),
      body: const DashboardPage(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Nova entrada',
        child: const Icon(Icons.add),
      ),
    );
  }
}
