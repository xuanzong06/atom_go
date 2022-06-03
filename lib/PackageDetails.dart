import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PackageDetails extends StatefulWidget {
  const PackageDetails({Key? key}) : super(key: key);

  @override
  _PackageDetailsState createState() => _PackageDetailsState();
}

class _PackageDetailsState extends State<PackageDetails> {
  var monthstr = DateFormat('MM').format(DateTime.now()).toString();
  var daystr = DateFormat('dd').format(DateTime.now()).toString();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.grey[300],
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //使最上排能夠分配距離
                          children: [
                            SafeArea(
                              child: Row(
                                children: [
                                  Text('選單'),
                                  Text('打卡功能1'),
                                  Switch(
                                      value: false,
                                      onChanged: (value) {
                                        value = true;
                                      }),
                                  Text('打卡功能2'),
                                  Switch(
                                      value: false,
                                      onChanged: (value) {
                                        value = true;
                                      }),
                                  Text('三個點'),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              //在Row下使用Expanded 可以達到左右
                              flex: 5,
                              child: Column(
                                children: [
                                  Text(
                                    '包裹運送查詢',
                                    style: TextStyle(
                                      fontSize: 30.0,
                                    ),
                                  ),
                                  Text('司機編號：250'),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Column(
                                children: [
                                  Container(
                                    child: Text(
                                      monthstr + "     ",
                                      style: TextStyle(fontSize: 30),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "     " + daystr,
                                      style: TextStyle(fontSize: 30),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //這裡開始修改
                            Container(
                              child: TabBar(
                                labelColor: Colors.green,
                                unselectedLabelColor: Colors.black,
                                tabs: [
                                  Tab(text: 'Tab 1'),
                                  Tab(text: 'Tab 2'),
                                  Tab(text: 'Tab 3'),
                                  Tab(text: 'Tab 4'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ), //全畫面的方法
                Expanded(
                  flex: 6, //因為增加bottonNavigationBar 從7降低為6
                  child: ListView(
                    children: [],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
