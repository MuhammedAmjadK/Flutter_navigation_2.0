// import 'package:flutter/material.dart';
// import 'package:flutter_web_navigation/core.dart';

// class Settings extends StatelessWidget {
//   final String routeName;

//   const Settings({
//     Key? key,
//     required this.routeName,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(
//         getRouteParams(routeName).length > 1
//             ? "Settings Screen with param ${getRouteParams(routeName)[1]}"
//             : "Settings Screen",
//         style: const TextStyle(color: Colors.blue, fontSize: 16),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

import '../routes/route_delegate.dart';
import '../routes/route_handeler.dart';
import '../routes/route_path.dart';
import '../services/hive_storage_service.dart';
import '../utils/data.dart';

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
        AppRouterDelegate().setPathName(RoutePath.otherPage(route.route.name));
      },
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

class ViewScreen extends StatelessWidget {
  const ViewScreen({Key? key, required this.id}) : super(key: key);

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
