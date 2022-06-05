import 'package:flutter/material.dart';

class KustomDrawer extends StatefulWidget {
  const KustomDrawer({Key? key}) : super(key: key);

  @override
  _KustomDrawerState createState() => _KustomDrawerState();
}

class _KustomDrawerState extends State<KustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 100,
              child: DrawerHeader(
                child: Text('導覽列'),
                decoration: BoxDecoration(
                  color: Colors.yellow,
                ),
              ),
            ),

            ListTile(
              title: Text('Option1'),
              onTap: (){},
            ),
            ListTile(
              title: Text('Option1'),
              onTap: (){},
            ),
          ],
        ),
      ),
    );
  }
}
