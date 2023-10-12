import 'package:flutter/material.dart';

import '../core.dart';

class Home extends StatelessWidget {
  final String routeName;
  final int id;

  const Home({
    Key? key,
    required this.routeName, required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return getTab(getRouteParams(routeName).last,id);
  }
}

Widget getTab(String routeName,int id) {
  switch (routeName) {
    case "home":
      return const HomeTab(id:2);
    case "create":
      return const Create();
    case "id":
      return const View();
    case "edit":
      return const Edit();
    case "detail":
      return const DetailTab();
    default:
      return const HomeTab(id:);
  }
}



class HomeTab extends StatelessWidget {
  const HomeTab({Key? key, required this.id}) : super(key: key);
final int id;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.green,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                AppRouterDelegate().setPathName(RoutePath.secondary("menu/create"));
              },
              child: const Text("create")),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                AppRouterDelegate().setPathName(RoutePath.secondary("menu/${id}"));
              },
              child: const Text("View")),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                AppRouterDelegate().setPathName(RoutePath.secondary("menu/edit"));
              },
              child: const Text("edit")),
          const SizedBox(height: 20),
          const Text(
            "Home Screen",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class Create extends StatelessWidget {
  const Create({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ElevatedButton(
          //     onPressed: () {
          //       AppRouterDelegate().setPathName(RoutePath.secondary("create"));
          //     },
          //     child: const Text("create")),
          const SizedBox(height: 20),
          const Text(
            "create",
            style: TextStyle(color: Colors.white, fontSize:40),
          ),
        ],
      ),
    );
  }
}

class View extends StatelessWidget {
  const View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.grey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ElevatedButton(
          //     onPressed: () {
          //       AppRouterDelegate().setPathName(RoutePath.secondary("view"));
          //     },
          //     child: const Text("view")),
          const SizedBox(height: 20),
          const Text(
            "view",
            style: TextStyle(color: Colors.white, fontSize:40),
          ),
        ],
      ),
    );
  }
}

class Edit extends StatelessWidget {
  const Edit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.yellow,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ElevatedButton(
          //     onPressed: () {
          //       // AppRouterDelegate().setPathName(RoutePath.secondary("edit"));
          //     },
          //     child: const Text("Edit")),
          const SizedBox(height: 20),
          const Text(
            "edit",
            style: TextStyle(color: Colors.black, fontSize:40),
          ),
        ],
      ),
    );
  }
}


class DetailTab extends StatelessWidget {
  const DetailTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.red,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Detail Screen",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
