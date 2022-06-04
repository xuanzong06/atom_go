import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PackageStatus extends StatefulWidget {
  const PackageStatus({Key? key}) : super(key: key);

  @override
  _PackageStatusState createState() => _PackageStatusState();
}

class _PackageStatusState extends State<PackageStatus> {
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
                                      fontSize: 21.0,
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
                                    child: Text(monthstr+"     ",style: TextStyle(fontSize: 30),),
                                  ),

                                  Container(
                                    child: Text("     "+daystr,style: TextStyle(fontSize: 30),),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              color: Colors.white,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        //如果宣告這個，外層的color要移到裡面，不然會出錯
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      // color: Colors.grey, //因為宣告BoxDecoration，所以要移進去
                                      child: Text(
                                        '12',
                                        style: TextStyle(fontSize: 10.0),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('未讀'),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.zero,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        //如果宣告這個，外層的color要移到裡面，不然會出錯
                                        color: Color(0xFF8B6B08),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      // color: Colors.grey, //因為宣告BoxDecoration，所以要移進去
                                      child: Text(
                                        '30',
                                        style: TextStyle(fontSize: 10.0),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      '未取',
                                      style: TextStyle(
                                        color: Color(0xFF8B6B08),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.zero,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        //如果宣告這個，外層的color要移到裡面，不然會出錯
                                        color: Color(0xFF0F9301),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      // color: Colors.grey, //因為宣告BoxDecoration，所以要移進去
                                      child: Text(
                                        '02',
                                        style: TextStyle(fontSize: 10.0),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      '已取',
                                      style: TextStyle(
                                        color: Color(0xFF0F9301),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.zero,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        //如果宣告這個，外層的color要移到裡面，不然會出錯
                                        color: Color(0xFFAF3535),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      // color: Colors.grey, //因為宣告BoxDecoration，所以要移進去
                                      child: Text(
                                        '09',
                                        style: TextStyle(fontSize: 10.0),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      '未送',
                                      style: TextStyle(
                                        color: Color(0xFFAF3535),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.zero,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        //如果宣告這個，外層的color要移到裡面，不然會出錯
                                        color: Color(0xFF2B51C9),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      // color: Colors.grey, //因為宣告BoxDecoration，所以要移進去
                                      child: Text(
                                        '23',
                                        style: TextStyle(fontSize: 10.0),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      '已送',
                                      style: TextStyle(
                                        color: Color(0xFF2B51C9),
                                      ),
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
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        color: Color(0xFFFFF0D2),
                        shadowColor: Colors.blueAccent,
                        child: Row(
                          // mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              height: 50.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: Text('未取 09:00'),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  20.0, 0.0, 100.0, 0.0),
                              child: Text('千多/水上'),
                            ),
                            Flexible(
                              child: Container(
                                // padding: EdgeInsets.only(right: 13.0),
                                child: Text(
                                  '台中#＃123456789', //我注意到＃井字號後面會直接強制省略
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                        // ListTile(
                        //   title: Text('未取'),
                        // ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        color: Color(0xFFDEFFD2),
                        shadowColor: Colors.blueAccent,
                        child: ListTile(
                          title: Text('已取'),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        color: Color(0xFFF05F5F), //#F05F5F
                        shadowColor: Colors.blueAccent,
                        child: ListTile(
                          title: Text('未送'),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        color: Color(0xFFD2EBFF),
                        shadowColor: Colors.blueAccent,
                        child: ListTile(
                          title: Text('已送'),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        color: Color(0xFFA7A7A7), //#A7A7A7
                        shadowColor: Colors.blueAccent,
                        child: ListTile(
                          title: Text('未讀'),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        color: Color(0xFFA7A7A7), //#A7A7A7
                        shadowColor: Colors.blueAccent,
                        child: ListTile(
                          title: Text('未讀'),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        color: Color(0xFFA7A7A7), //#A7A7A7
                        shadowColor: Colors.blueAccent,
                        child: ListTile(
                          title: Text('未讀'),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        color: Color(0xFFA7A7A7), //#A7A7A7
                        shadowColor: Colors.blueAccent,
                        child: ListTile(
                          title: Text('未讀'),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        color: Color(0xFFA7A7A7), //#A7A7A7
                        shadowColor: Colors.blueAccent,
                        child: ListTile(
                          title: Text('未讀'),
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
