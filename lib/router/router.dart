import 'package:finder/views/page/home.dart';
import 'package:finder/views/page/bachelor_favorites.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
        path: '/',
        builder: (context, routeurState) => const Home(),
        routes: [
          GoRoute(
            path: 'favorites',
            builder: (context, routeurState) => const BachelorFavorites(),
          ),
        ]),
  ],
);
