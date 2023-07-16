import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:online_restaurant/bottom_navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final _router = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  observers: [
    GoRouterObserver(),
  ],
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return ScaffoldWithNavBar(child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) {
            return const Home1();
          },
        ),
        GoRoute(
          path: '/discover',
          builder: (context, state) {
            return const Home2();
          },
        ),
        GoRoute(
            path: '/shop',
            builder: (context, state) {
              return const Home3();
            }),
        GoRoute(
          path: '/login',
          builder: (context, state) {
            return const Home4();
          },
        ),
      ],
    ),
  ],
);

class GoRouterObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {}

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {}

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {}

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {}
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Platform',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: _router,
    );
  }
}

class Home1 extends StatelessWidget {
  const Home1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Home1'),
      ),
    );
  }
}

class Home2 extends StatelessWidget {
  const Home2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Discover'),
      ),
    );
  }
}

class Home3 extends StatelessWidget {
  const Home3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Shop'),
      ),
    );
  }
}

class Home4 extends StatelessWidget {
  const Home4({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('MY'),
      ),
    );
  }
}
