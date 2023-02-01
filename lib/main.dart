import 'package:flutter/material.dart';
import 'package:flutter_ativo/core/default_theme.dart';
import 'package:flutter_ativo/features/home/home.dart';
import 'package:go_router/go_router.dart';

import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Global ServiceLocator
  await di.init();

  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    //
    return MaterialApp.router(
      theme: themeDefault,
      routeInformationProvider: _router.routeInformationProvider,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      debugShowCheckedModeBanner: false,
    );
  }

  late final _router = GoRouter(
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        name: 'root',
        path: '/',
        builder: (context, state) => HomePage(),
      ),
      // GoRoute(
      //   name: 'login',
      //   path: '/login',
      //   builder: (context, state) => LoginPage(),
      // ),
      // GoRoute(
      //   name: 'home',
      //   path: '/home',
      //   builder: (context, state) => HomePage(),
      // ),
    ],
  );
}
