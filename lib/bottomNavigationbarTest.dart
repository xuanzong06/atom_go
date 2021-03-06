import 'package:atom_go/KustomWidget/TopNavigator.dart';
import 'package:atom_go/KustomWidget/TopNavigator2.dart';
import 'package:atom_go/PersonalPage.dart';
import 'package:atom_go/Test/NonePage.dart';

import 'Package/PackageStatus.dart';
import 'package:flutter/material.dart';

import 'DemoP.dart';
import 'bottomNavigationbarTest.dart';
import 'FrontPage.dart';
import 'Package/PackageDetails.dart';
import 'SearchBarTest.dart';
import 'DoImagePicker.dart';
import 'MapService/KustomMap.dart';
import 'package:flutter/rendering.dart';

// void main() => runApp(const MyApp());

void main() {
  debugPaintSizeEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    FrontPage(),
    PackageStatus(),
    NonePage(),
    TopNavigator2(),
    KustomMap(),
    PersonalPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(
        //   title: const Text('BottomNavigationBar Sample'),
        // ),
        body: IndexedStack(
          index: _selectedIndex,
          children: _widgetOptions,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          //大於三個以上的時候，要增加這個屬性才會正常顯示
          showSelectedLabels: false,
          //這兩個屬性可以隱藏
          showUnselectedLabels: false,
          //
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.apps),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Business',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.campaign),
              label: 'School',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.access_time),
              label: 'Test',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.pin_drop),
              label: 'profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
