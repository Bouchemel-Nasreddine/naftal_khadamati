import 'package:flutter/material.dart';
import 'package:khadamti/ui/maps/general_map_view.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  //screens
  //when adding a screen to list don't forget to add the icon at iconList

  var screens = [GeneraleMap()];

  //icons list
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.map),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PersistentTabView(
          context,
          screens: [GeneraleMap(), Center(child: Text('person'))],
          items: _navBarsItems(),
        ),
      ),
    );
  }
}
