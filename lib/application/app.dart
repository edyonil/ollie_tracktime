import 'package:flutter/material.dart';
import 'package:ollie_tracktime/application/router_resolve.dart';

// ignore: must_be_immutable
class App extends StatelessWidget {
  late RouterResolve routerResolve;

  App({Key? key}) : super(key: key) {
    routerResolve = RouterResolve();

    routerResolve.register();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: routerResolve.generateRoute,
      initialRoute: '/login',
    );
  }
}
