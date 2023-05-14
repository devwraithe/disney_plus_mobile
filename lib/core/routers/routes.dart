import 'package:disney_plus/core/routers/routes_config.dart';
import 'package:disney_plus/presentation/screens/movie_info.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/screens/home.dart';

final routes = [
  GoRoute(
    name: "home",
    path: "/home",
    parentNavigatorKey: RoutesConfig.navigationKey,
    builder: (context, state) => const Home(),
  ),
  GoRoute(
    name: "movie_info",
    path: "/movie_info/:movie_id",
    parentNavigatorKey: RoutesConfig.navigationKey,
    builder: (context, state) => MovieInfo(
      movieId: state.pathParameters['movie_id']!,
    ),
  ),
];
