import 'package:docs_google/screens/home_screen.dart';
import 'package:docs_google/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

final loggedOutRoute = RouteMap(
  routes: {
    '/': (route) => const MaterialPage(
          child: LoginScreen(),
        ),
  },
);

final loggedInRoute = RouteMap(
  routes: {
    '/': (route) => const MaterialPage(
          child: HomeScreen(),
        ),
  },
);
