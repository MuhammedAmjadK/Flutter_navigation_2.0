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
  SubNavigationRoutes(title: "trip_start", icon: Icons.directions_bus_sharp, route: RouteData.trip_start),
  SubNavigationRoutes(title: "trip_end", icon: Icons.directions_bus_sharp, route: RouteData.trip_end),
  SubNavigationRoutes(title: "trip_on", icon: Icons.directions_bus_sharp, route: RouteData.trip_on),
  SubNavigationRoutes(title: "trips", icon: Icons.directions_bus_sharp, route: RouteData.trips),
];

List<SubNavigationRoutes> settingsRouteList = [
  SubNavigationRoutes(title: "price", icon: Icons.directions_bus_sharp, route: RouteData.price),
  SubNavigationRoutes(title: "category", icon: Icons.directions_bus_sharp, route: RouteData.category),
];
