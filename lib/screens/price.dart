import 'package:flutter/material.dart';
import 'package:flutter_web_navigation/screens/category_screen.dart';

import '../core.dart';
import 'settings_screen.dart';

class Price extends StatelessWidget {
  final String routeName;

  const Price({
    Key? key,
    required this.routeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return getTab(getRouteParams(routeName).last);
  }
}

Widget getTab(String routeName) {
  switch (routeName) {
    case "price":
      return const PriceTab();
    case "create":
      return const Create();
    case "edit":
      return const Edit();
    case "detail":
      return const DetailTab();
    default:
      return ViewScreen(id: routeName);
  }
}

class PriceTab extends StatelessWidget {
  const PriceTab({
    Key? key,
  }) : super(key: key);
  final String id1 = "21";
  final String id2 = "45";
  final String id3 = "149";
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.pinkAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                AppRouterDelegate().setPathName(RoutePath.secondary("create"));
              },
              child: const Text("create")),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                AppRouterDelegate().setPathName(RoutePath.secondary(id2));
              },
              child: const Text("View ")),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                AppRouterDelegate().setPathName(RoutePath.secondary("edit"));
              },
              child: const Text("edit")),
          const SizedBox(height: 20),
          const Text(
            "Price Screen",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
