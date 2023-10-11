import 'package:flutter/material.dart';
import 'package:flutter_web_navigation/core.dart';

class SubNavigationRoutes {
  String title;
  IconData icon;
  RouteData route;
  SubNavigationRoutes({required this.title, required this.icon, required this.route});
}

List<SubNavigationRoutes> routeList = [
  SubNavigationRoutes(title: RouteData.home.name.toUpperCase(), icon: Icons.home, route: RouteData.home),
  SubNavigationRoutes(title: RouteData.profile.name.toUpperCase(), icon: Icons.person, route: RouteData.profile),
  SubNavigationRoutes(title: RouteData.settings.name.toUpperCase(), icon: Icons.settings, route: RouteData.settings),
  SubNavigationRoutes(title: RouteData.more.name.toUpperCase(), icon: Icons.more, route: RouteData.more),
];

List<SubNavigationRoutes> tripRouteList = [
  SubNavigationRoutes(title: "Trip", icon: Icons.more, route: RouteData.trip),
  SubNavigationRoutes(title: "Trip1", icon: Icons.home, route: RouteData.trip1),
  SubNavigationRoutes(title: "Trip2", icon: Icons.person, route: RouteData.trip2),
  SubNavigationRoutes(title: "Trip3", icon: Icons.settings, route: RouteData.trip3),
];
