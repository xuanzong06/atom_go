import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget2(),
    );
  }
}

class MyStatefulWidget2 extends StatefulWidget {
  const MyStatefulWidget2({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget2> createState() => _MyStatefulWidget2State();
}

/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _MyStatefulWidget2State extends State<MyStatefulWidget2>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TabBar Widget'),
      ),
      body: Padding(
        padding: EdgeInsets.all(0),
        child: Column(
          children: [
            Container(
              height: 40,
              // width: 400,
              color: Colors.teal,
              child: TabBar(
                controller: _tabController,
                tabs: const <Widget>[
                  Tab(
                    // icon: Icon(Icons.cloud_outlined),
                    text: '送件資料',
                  ),
                  Tab(
                    // icon: Icon(Icons.beach_access_sharp),
                    text: '取件資料',
                  ),
                  Tab(
                    // icon: Icon(Icons.brightness_5_sharp),
                    text: '上傳資料',
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.yellowAccent,
              height: 50,
              width: 50,
              child: TabBarView(
                controller: _tabController,
                children: const <Widget>[
                  Center(
                    child: Text("It's cloudy here"),
                  ),
                  Center(
                    child: Text("It's rainy here"),
                  ),
                  Center(
                    child: Text("It's sunny here"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
