import 'package:flutter/material.dart';

import '../routes/route_delegate.dart';
import '../routes/route_handeler.dart';
import '../routes/route_path.dart';
import '../services/hive_storage_service.dart';
import '../services/split_route_params.dart';
import '../utils/data.dart';
import 'home_screen.dart';

class TripScreen extends StatefulWidget {
  // Receives the name of the route from router delegate
  final String routeName;

  const TripScreen({
    Key? key,
    required this.routeName,
  }) : super(key: key);

  @override
  State<TripScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<TripScreen> {
  Widget? render;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trip Page'),
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
                itemCount: tripRouteList.length,
                itemBuilder: (context, i) {
                  return _navTile(tripRouteList[i]);
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

class TripHome extends StatelessWidget {
  final String routeName;

  const TripHome({
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
    case "trip":
      return const TripTab();
    case "tab1":
      return const Tab1();
    case "tab2":
      return const Tab2();
    case "detail":
      return const DetailTab();
    default:
      return const TripTab();
  }
}

class TripTab extends StatelessWidget {
  const TripTab({Key? key}) : super(key: key);

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
                AppRouterDelegate().setPathName(RoutePath.secondary("tab1"));
              },
              child: const Text("Tab 1")),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                AppRouterDelegate().setPathName(RoutePath.secondary("tab2"));
              },
              child: const Text("Tab 2")),
          const SizedBox(height: 20),
          const Text(
            "Trip Screen",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class Trip1 extends StatelessWidget {
  final String routeName;
  const Trip1({
    Key? key,
    required this.routeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        getRouteParams(routeName).length > 1
            ? "Trip1 Screen with param ${getRouteParams(routeName)[1]}"
            : "Trip1 Screen",
        style: const TextStyle(color: Colors.blue, fontSize: 16),
      ),
    );
  }
}

class Trip2 extends StatelessWidget {
  final String routeName;
  const Trip2({
    Key? key,
    required this.routeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        getRouteParams(routeName).length > 1
            ? "Trip2 Screen with param ${getRouteParams(routeName)[1]}"
            : "Trip2 Screen",
        style: const TextStyle(color: Colors.blue, fontSize: 16),
      ),
    );
  }
}

class Trip3 extends StatelessWidget {
  final String routeName;
  const Trip3({
    Key? key,
    required this.routeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        getRouteParams(routeName).length > 1
            ? "Trip3 Screen with param ${getRouteParams(routeName)[1]}"
            : "Trip3 Screen",
        style: const TextStyle(color: Colors.blue, fontSize: 16),
      ),
    );
  }
}
