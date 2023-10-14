import 'package:flutter/material.dart';

import '../routes/route_delegate.dart';
import '../routes/route_path.dart';
import '../services/split_route_params.dart';
import 'settings_screen.dart';

class Category extends StatelessWidget {
  final String routeName;

  const Category({
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
    case "category":
      return const CategoryTab();
    case "create":
      return const Create();
    // case "$id":
    //   return const View();
    case "edit":
      return const Edit();
    case "detail":
      return const DetailTab();
    default:
      return ViewScreen(id: routeName);
  }
}

class CategoryTab extends StatelessWidget {
  const CategoryTab({
    Key? key,
  }) : super(key: key);
  final String id1 = "21";
  final String id2 = "45";
  final String id3 = "149";
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.orange,
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
                AppRouterDelegate().setPathName(RoutePath.secondary(id1));
              },
              child: const Text("View ")),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                AppRouterDelegate().setPathName(RoutePath.secondary("edit/$id1"));
              },
              child: const Text("edit")),
          const SizedBox(height: 20),
          const Text(
            "Payment Screen",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
