import 'package:flutter/material.dart';
import 'package:ollie_tracktime/core/router_provider.dart';
import 'package:ollie_tracktime/core/util.dart';
import 'package:ollie_tracktime/features/auth/router_auth.dart';

class RouterResolve {
  List<RouterProvider> routesProvider = [
    RouterAuth(),
  ];

  final Map<String, WidgetBuilderArgs> _routes = {};

  void register() {
    for (final routes in routesProvider) {
      _routes.addAll(routes.routes);
    }
  }

  Route<dynamic>? generateRoute(RouteSettings settings) {
    final routerName = settings.name;
    final routerArgs = settings.arguments;

    final navigateTo = _routes[routerName];
    if (navigateTo == null) return null;

    return MaterialPageRoute(
      builder: (context) => navigateTo.call(context, routerArgs),
    );
  }
}
