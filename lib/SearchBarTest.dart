import 'package:flutter/material.dart';

class KustomSearchBar extends StatefulWidget {
  const KustomSearchBar({Key? key}) : super(key: key);

  @override
  _KustomSearchBarState createState() => _KustomSearchBarState();
}

class _KustomSearchBarState extends State<KustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amberAccent,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50), //這行要先關閉color，否則出錯
      ),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
    );
  }
}

