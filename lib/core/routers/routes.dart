import 'package:disney_plus/core/routers/routes_config.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/screens/home.dart';

final routes = [
  GoRoute(
    name: "home",
    path: "/home",
    parentNavigatorKey: RoutesConfig.navigationKey,
    builder: (context, state) => const Home(),
  ),
];
