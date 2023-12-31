import 'package:flutter/material.dart';
import 'package:flutter_web_navigation/core.dart';

/// parseRouteInformation will convert the given route information into parsed data to pass to RouterDelegate.
class RoutesInformationParser extends RouteInformationParser<RoutePath> {
  @override
  Future<RoutePath> parseRouteInformation(RouteInformation routeInformation) async {
    // converting the url into custom class T (RoutePath)
    // final uri = Uri.parse('/home');
    final uri = Uri.parse(routeInformation.location!);

    if (uri.pathSegments.isEmpty) {
      return RoutePath.home('/');
    }

    /// For query params- pass the complete path
    if (uri.queryParameters.isNotEmpty) {
      return RoutePath.otherPage(routeInformation.location!.replaceFirst("/", ""));
    }

    if (uri.pathSegments.length == 1) {
      final pathName = uri.pathSegments.elementAt(0).toString();

      return RoutePath.otherPage(pathName);
    } else if (uri.pathSegments.length == 2) {
      final complexPath = uri.pathSegments.elementAt(0).toString() + "/" + uri.pathSegments.elementAt(1).toString();
      return RoutePath.otherPage(complexPath.toString());
    } else {
      return RoutePath.otherPage(uri.toString());
    }
  }

  @override
  RouteInformation restoreRouteInformation(RoutePath configuration) {
    String? path = configuration.pathName;
    if (configuration.pathName?.startsWith("/") ?? false) {
      path = path?.substring(1);
    }
    if (configuration.isUnknown) {
      return const RouteInformation(location: '/error');
    }
    if (configuration.isHomePage) {
      return const RouteInformation(location: '/');
    }
    if (configuration.isOtherPage) {
      return RouteInformation(location: '/$path');
    }

    return const RouteInformation(location: "/");
  }
}
