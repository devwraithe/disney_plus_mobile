import 'package:disney_plus/core/routers/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RoutesConfig {
  static final navigationKey = GlobalKey<NavigatorState>();
  static final routeConfig = GoRouter(
    initialLocation: '/home',
    navigatorKey: navigationKey,
    routes: routes,
  );
}
