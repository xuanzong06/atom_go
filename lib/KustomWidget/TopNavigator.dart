import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; //DateFormat

class TopNavigator extends StatefulWidget {
  const TopNavigator({Key? key}) : super(key: key);

  @override
  _TopNavigatorState createState() => _TopNavigatorState();
}

class _TopNavigatorState extends State<TopNavigator> {
  bool punchStart = false;
  bool punchEnd = false;
  String punchStartStr = "未打卡";
  String punchEndStr = "未打卡";

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
            Text(punchStartStr),
            Switch(
                value: punchStart,
                activeColor: Colors.black12,
                onChanged: (value) {
                  if (punchStart == false) {
                    //只有false的時候才有功能
                    setState(() {
                      punchStart = !punchStart;
                      punchStartStr =
                          DateFormat('HH:mm').format(DateTime.now()).toString();
                    });
                  }
                }),
            Text(punchEndStr),
            Switch(
                value: punchEnd,
                activeColor: Colors.black12,
                onChanged: (value) {
                  if (punchEnd == false) {
                    //只有false的時候才有功能
                    setState(() {
                      punchEnd = !punchEnd;
                      punchEndStr =
                          DateFormat('HH:mm').format(DateTime.now()).toString();
                    });
                  }
                }),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
          ],
        ),
      ),
    );
  }
}

//可以顯示兩個IconButton，並且一個顯示在最左邊、一個顯示在最右邊
//第一種
// return Container(
//   color: Colors.amber,
//   child: Row(
//     children: [
//       IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
//       Spacer(),
//       IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
//     ],
//   ),
// );
//第二種
// return Container(
//   color: Colors.amber,
//   child: Row(
//     children: [
//       IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
//       Expanded(child: SizedBox()),
//       IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
//     ],
//   ),
// );

//首頁打卡的顯示方式，有六個小元件
// return Container(
//   color: Colors.amber,
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
//       Text('data'),
//       Switch(value: false, onChanged: (value){}),
//       Text('data2'),
//       Switch(value: false, onChanged: (value){}),
//       IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
//     ],
//   ),
// );
