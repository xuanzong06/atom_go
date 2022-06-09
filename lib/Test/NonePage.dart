import 'package:flutter/material.dart';

class NonePage extends StatefulWidget {
  const NonePage({Key? key}) : super(key: key);

  @override
  _NonePageState createState() => _NonePageState();
}

class _NonePageState extends State<NonePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('data'),
        ),
      ),
    );
  }
}
