import 'package:flutter/material.dart';

class TopNavigator2 extends StatefulWidget {
  const TopNavigator2({Key? key}) : super(key: key);

  @override
  _TopNavigator2State createState() => _TopNavigator2State();
}

class _TopNavigator2State extends State<TopNavigator2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Row(
        children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
          Spacer(),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
        ],
      ),
    );
  }
}
