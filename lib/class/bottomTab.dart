import 'package:flutter/material.dart';
import 'package:watchmovie_app/account.dart';
import 'package:watchmovie_app/home_screen.dart';
import 'package:watchmovie_app/Hothit.dart';
//import 'package:watchmovie_app/home_screen2.dart';

class bottomTab extends StatefulWidget {
  const bottomTab({super.key});

  @override
  State<bottomTab> createState() => _bottomTabState();
}

class _bottomTabState extends State<bottomTab> {
  int currentPageIndex = 0;
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.alwaysHide;

    
  // List of pages
  final List<Widget> pages = [
    HomeScreen(),
    Hothit(),
    Account()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPageIndex], // Show the current page
      bottomNavigationBar: NavigationBar(
        labelBehavior: labelBehavior,
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.tv),
            label: 'Hothit',
          ),
          NavigationDestination(
            // selectedIcon: Icon(Icons.account_balance),
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}

// Example page widgets
class ExplorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Home'),
    );
  }
}

class CommutePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Hothit'),
    );
  }
}

class SavedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Account'),
    );
  }
}
