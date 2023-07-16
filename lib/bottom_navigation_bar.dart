import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class ScaffoldWithNavBar extends StatefulWidget {
  const ScaffoldWithNavBar({super.key, required this.child});

  final Widget child;

  @override
  State<ScaffoldWithNavBar> createState() => _ScaffoldWithNavBarState();
}

class _ScaffoldWithNavBarState extends State<ScaffoldWithNavBar> {
  int _currentIndex = 0;

  static const List<MyCustomBottomNavBarItem> tabs = [
    MyCustomBottomNavBarItem(
      icon: Icons.home,
      text: 'HOME',
      initialLocation: '/',
    ),
    MyCustomBottomNavBarItem(
      icon: Icons.explore_outlined,
      text: 'DISCOVER',
      initialLocation: '/discover',
    ),
    MyCustomBottomNavBarItem(
      icon: Icons.storefront_outlined,
      text: 'SHOP',
      initialLocation: '/shop',
    ),
    MyCustomBottomNavBarItem(
      icon: Icons.account_circle_outlined,
      text: 'MY',
      initialLocation: '/login',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: widget.child),
      bottomNavigationBar: Container(
        color: Colors.grey,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: GNav(
          onTabChange: (int index) {
            _goOtherTab(context, index);
          },
          selectedIndex: _currentIndex,
          tabs: tabs,
          color: Colors.amber,
          activeColor: Colors.white,
          gap: 5,
          backgroundColor: Colors.grey,
          tabBackgroundColor: Colors.black,
          tabBorderRadius: 25,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        ),
      ),
    );
  }

  void _goOtherTab(BuildContext context, int index) {
    if (index == _currentIndex) return;
    GoRouter router = GoRouter.of(context);
    String location = tabs[index].initialLocation;
    if (index == 3) {
      router.push(location);
    }

    setState(() {
      _currentIndex = index;
      router.go(location);
    });
  }
}

class MyCustomBottomNavBarItem extends GButton {
  final String initialLocation;

  const MyCustomBottomNavBarItem({
    required this.initialLocation,
    required IconData icon,
    required String text,
  }) : super(
          icon: icon,
          text: text,
        );
}
