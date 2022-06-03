import 'package:atom_go/HorizontalLine.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PackageDetails extends StatefulWidget {
  const PackageDetails({Key? key}) : super(key: key);

  @override
  _PackageDetailsState createState() => _PackageDetailsState();
}

class _PackageDetailsState extends State<PackageDetails>
    with TickerProviderStateMixin {
  // with TickerProviderStateMixin 是為了controller vsync
  var monthstr = DateFormat('MM').format(DateTime.now()).toString();
  var daystr = DateFormat('dd').format(DateTime.now()).toString();

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

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
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Row(
                                children: [
                                  Container(
                                    height: 30,
                                    width: 300,
                                    // color: Colors.teal,
                                    child: TabBar(
                                      labelColor: Colors.black,
                                      //這裡定義文字顏色
                                      indicatorColor: Colors.red,
                                      //底線顏色，看起來要寫邏輯判斷！！
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
                    children: [
                      Container(
                        color: Colors.yellowAccent,
                        height: 200,
                        width: 50,
                        child: TabBarView(
                          controller: _tabController,
                          children: <Widget>[
                            Center(
                              child: Column(
                                children: [
                                  Text("設計送件資料"),
                                ],
                              ),
                            ),
                            Center(
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(),
                                  ),
                                  Expanded(
                                    flex: 8,
                                    child: Column(
                                      children: [
                                        Text("取件資料"),
                                        HorizontalLine(),
                                        Text('data'),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(),
                                  ),
                                ],
                              ),
                            ),
                            Center(
                              child: Column(
                                children: [
                                  Text("設計上傳資料"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.teal,
                        height: 300,
                        width: 50,
                        child: TabBarView(
                          controller: _tabController,
                          children: <Widget>[
                            Center(
                              child: Column(
                                children: [
                                  Text("設計送件資料"),
                                ],
                              ),
                            ),
                            Center(
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(),
                                  ),
                                  Expanded(
                                    flex: 8,
                                    child: Column(
                                      children: [
                                        Text("備註"),
                                        HorizontalLine(),
                                        Text('data'),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(),
                                  ),
                                ],
                              ),
                            ),
                            Center(
                              child: Column(
                                children: [
                                  Text("設計上傳資料"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
