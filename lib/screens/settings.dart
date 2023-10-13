import 'package:flutter/material.dart';

import '../routes/route_delegate.dart';
import '../routes/route_handeler.dart';
import '../routes/route_path.dart';
import '../services/hive_storage_service.dart';
import '../services/split_route_params.dart';
import '../utils/data.dart';
import 'home_screen.dart';

class SettingsScreen extends StatefulWidget {
  // Receives the name of the route from router delegate
  final String routeName;

  const SettingsScreen({
    Key? key,
    required this.routeName,
  }) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Widget? render;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings Page'),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () => _logOut(),
              child: const Center(
                child: Text(
                  'Log Out ',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          )
        ],
      ),
      body: Row(
        key: UniqueKey(),
        children: [
          Drawer(
            elevation: 1,
            child: ListView.builder(
                itemCount: settingsRouteList.length,
                itemBuilder: (context, i) {
                  return _navTile(settingsRouteList[i]);
                }),
          ),
          Expanded(
            child: Center(child: RouteHandeler().getRouteWidget(widget.routeName)),
          ),
        ],
      ),
    );
  }

  _logOut() async {
    await HiveDataStorageService.logOutUser();
    AppRouterDelegate().setPathName(RoutePath.otherPage(RouteData.login.name), loggedIn: false);
  }

  Widget _navTile(SubNavigationRoutes route) {
    return ListTile(
      leading: Icon(
        route.icon,
        color: widget.routeName.contains(route.route.name) ? Colors.blue : Colors.grey,
      ),
      title: Text(
        route.title,
        style: TextStyle(
          color: widget.routeName.contains(route.route.name) ? Colors.blue : Colors.grey,
        ),
      ),
      onTap: () {
        AppRouterDelegate().setPathName(RoutePath.secondary(route.route.name));
      },
    );
  }
}
Widget getTab(String routeName) {
  switch (routeName) {
    case "settings":
      return const Price(routeName: '/',);
    case "create":
      return const Create();
  // case "$id":
  //   return const View();
    case "edit":
      return const Edit();
    case "detail":
      return const DetailTab();
    default:
      return View(id: routeName);
  }
}

// class SettingsTab extends StatelessWidget {
//   const SettingsTab({Key? key}) : super(key: key);
//   final String id1 = "21";
//   final String id2 = "22";
//   final String id3 = "149";
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.center,
//       color: Colors.green,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           ElevatedButton(
//               onPressed: () {
//                 AppRouterDelegate().setPathName(RoutePath.secondary("tab1"));
//               },
//               child: const Text("Tab 1")),
//           const SizedBox(height: 20),
//           ElevatedButton(
//               onPressed: () {
//                 AppRouterDelegate().setPathName(RoutePath.secondary("tab2"));
//               },
//               child: const Text("Tab 2")),
//           const SizedBox(height: 20),
//           const Text(
//             "Trip Screen",
//             style: TextStyle(color: Colors.white, fontSize: 16),
//           ),
//         ],
//       ),
//     );
//   }
// }

class Price extends StatelessWidget {
  final String routeName;
  const Price({
    Key? key,
    required this.routeName,
  }) : super(key: key);
  final String id1 = "21";
  final String id2 = "45";
  final String id3 = "149";
  @override
  Widget build(BuildContext context) {
    return  Container(
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
                AppRouterDelegate().setPathName(RoutePath.secondary("$id2"));
              },
              child: Text("View ")),
          const SizedBox(height: 20),
          // ElevatedButton(
          //     onPressed: () {
          //       AppRouterDelegate().setPathName(RoutePath.secondary("menu/$id2"));
          //     },
          //     child: Text("View $id2")),
          // const SizedBox(height: 20),
          // ElevatedButton(
          //     onPressed: () {
          //       AppRouterDelegate().setPathName(RoutePath.secondary("menu/$id3"));
          //     },
          //     child: Text("View $id3")),
          const SizedBox(height: 10),
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

class Category extends StatelessWidget {
  final String routeName;
  const Category({
    Key? key,
    required this.routeName,
  }) : super(key: key);
  final String id1 = "21";
  final String id2 = "45";
  final String id3 = "149";
  @override
  Widget build(BuildContext context) {
    return  Container(
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
                AppRouterDelegate().setPathName(RoutePath.secondary("$id1"));
              },
              child: Text("View ")),
          const SizedBox(height: 20),
          // ElevatedButton(
          //     onPressed: () {
          //       AppRouterDelegate().setPathName(RoutePath.secondary("menu/$id2"));
          //     },
          //     child: Text("View $id2")),
          // const SizedBox(height: 20),
          // ElevatedButton(
          //     onPressed: () {
          //       AppRouterDelegate().setPathName(RoutePath.secondary("menu/$id3"));
          //     },
          //     child: Text("View $id3")),
          const SizedBox(height: 10),
          ElevatedButton(
              onPressed: () {
                AppRouterDelegate().setPathName(RoutePath.secondary("edit"));
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
class Create extends StatelessWidget {
  const Create({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.red,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ElevatedButton(
          //     onPressed: () {
          //       AppRouterDelegate().setPathName(RoutePath.secondary("create"));
          //     },
          //     child: const Text("create")),
          SizedBox(height: 20),
          Text(
            "create",
            style: TextStyle(color: Colors.white, fontSize: 40),
          ),
        ],
      ),
    );
  }
}

class View extends StatelessWidget {
  const View({Key? key, required this.id}) : super(key: key);

  final String id;

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
          Text(
            id,
            style: const TextStyle(color: Colors.white, fontSize: 40),
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
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ElevatedButton(
          //     onPressed: () {
          //       // AppRouterDelegate().setPathName(RoutePath.secondary("edit"));
          //     },
          //     child: const Text("Edit")),
          SizedBox(height: 20),
          Text(
            "edit",
            style: TextStyle(color: Colors.black, fontSize: 40),
          ),
        ],
      ),
    );
  }
}
