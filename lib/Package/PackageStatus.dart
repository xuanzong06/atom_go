import 'package:atom_go/Package/PackageDetails.dart';
import 'package:atom_go/Package/PackageDetails2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Kustom/KustomDrawer.dart';

class PackageStatus extends StatefulWidget {
  const PackageStatus({Key? key}) : super(key: key);

  @override
  _PackageStatusState createState() => _PackageStatusState();
}

class _PackageStatusState extends State<PackageStatus> {
  final _scaffoldKey =
      GlobalKey<ScaffoldState>(); //自定義IconButton.menu 需要這個值 1/3

  var monthstr = DateFormat('MM').format(DateTime.now()).toString();
  var daystr = DateFormat('dd').format(DateTime.now()).toString();

  bool unread = true; //未讀
  bool unpick = true; //未取
  bool picked = true; //已取
  bool undelivery = true; //未送
  bool deliveried = true; //已送

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        //避免要輸入文字時，鍵盤彈出，底部Widget被往上擠，但除此之外body的設計邏輯也要調整
        key: _scaffoldKey,
        //自定義IconButton.menu 需要這個值 2/3
        drawer: Drawer(
          child: KustomDrawer(),
        ),
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          //使最上排能夠分配距離
                          children: [
                            SafeArea(
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () =>
                                        _scaffoldKey.currentState?.openDrawer(),
                                    //自定義IconButton.menu 需要這個值 3/3
                                    icon: Icon(Icons.menu),
                                  ),
                                  Container(
                                    // color: Colors.white,
                                    height: 30,
                                    width: 270,
                                    // decoration: BoxDecoration(
                                    //   borderRadius: BorderRadius.circular(50),
                                    // ),
                                    // color: Colors.amberAccent,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.fromLTRB(10, 10, 0, 0),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        hintText: '請輸入關鍵字',
                                      ),
                                      style: TextStyle(),
                                    ),
                                  ),
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
                                  //開發點擊功能
                                  GestureDetector(
                                    onTap: () {
                                      print('click');
                                      setState(() {
                                        unread = true; //未讀
                                        unpick = false; //未取
                                        picked = false; //已取
                                        undelivery = false; //未送
                                        deliveried = false; //已送
                                      });
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text('未讀'),
                                    ),
                                  ),
                                  //-------------

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
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        unread = false; //未讀
                                        unpick = true; //未取
                                        picked = false; //已取
                                        undelivery = false; //未送
                                        deliveried = false; //已送
                                      });
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        '未取',
                                        style: TextStyle(
                                          color: Color(0xFF8B6B08),
                                        ),
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

                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        unread = false; //未讀
                                        unpick = false; //未取
                                        picked = true; //已取
                                        undelivery = false; //未送
                                        deliveried = false; //已送
                                      });
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        '已取',
                                        style: TextStyle(
                                          color: Color(0xFF0F9301),
                                        ),
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

                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        unread = false; //未讀
                                        unpick = false; //未取
                                        picked = false; //已取
                                        undelivery = true; //未送
                                        deliveried = false; //已送
                                      });
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        '未送',
                                        style: TextStyle(
                                          color: Color(0xFFAF3535),
                                        ),
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
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        unread = false; //未讀
                                        unpick = false; //未取
                                        picked = false; //已取
                                        undelivery = false; //未送
                                        deliveried = true; //已送
                                      });
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        '已送',
                                        style: TextStyle(
                                          color: Color(0xFF2B51C9),
                                        ),
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
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) => new PackageDetails2(missioncode: 'unpick',))),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          color: Color(0xFFFFF0D2),
                          shadowColor: Colors.blueAccent,
                          child: Visibility(
                            visible: unpick,
                            child: GestureDetector(
                              onTap: () {},
                              child: Row(
                                // mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    height: 50.0,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20.0, 0.0, 50.0, 0.0),
                                    child: Text('09:00'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20.0, 0.0, 70.0, 0.0),
                                    child: Text('千多/水上'),
                                  ),
                                  Flexible(
                                    child: Container(
                                      // padding: EdgeInsets.only(right: 13.0),
                                      child: Text(
                                        '台中#00001', //我注意到＃井字號後面會直接強制省略
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // ListTile(
                          //   title: Text('未取'),
                          // ),
                        ),
                      ),

                      GestureDetector(
                        onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) => new PackageDetails2(missioncode: 'picked',))),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          color: Color(0xFFDEFFD2),
                          shadowColor: Colors.blueAccent,
                          child: Visibility(
                            visible: picked,
                            child: Row(
                              children: [
                                Container(
                                  height: 50.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      20.0, 0.0, 50.0, 0.0),
                                  child: Text('10:00'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      20.0, 0.0, 70.0, 0.0),
                                  child: Text('千多/水上'),
                                ),
                                Flexible(
                                  child: Container(
                                    // padding: EdgeInsets.only(right: 13.0),
                                    child: Text(
                                      '台中#00002', //我注意到＃井字號後面會直接強制省略
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) => new PackageDetails2(missioncode: 'undelivery',))),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          color: Color(0xFFF05F5F), //#F05F5F
                          shadowColor: Colors.blueAccent,
                          child: Visibility(
                            visible: undelivery,
                            child: Row(
                              children: [
                                Container(
                                  height: 50.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      20.0, 0.0, 50.0, 0.0),
                                  child: Text('10:30'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      20.0, 0.0, 70.0, 0.0),
                                  child: Text('千多/水上'),
                                ),
                                Flexible(
                                  child: Container(
                                    // padding: EdgeInsets.only(right: 13.0),
                                    child: Text(
                                      '台中#00003', //我注意到＃井字號後面會直接強制省略
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),


                      GestureDetector(
                        onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) => new PackageDetails2(missioncode: 'deliveried',))),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          color: Color(0xFFD2EBFF),
                          shadowColor: Colors.blueAccent,
                          child: Visibility(
                            visible: deliveried,
                            child: Row(
                              children: [
                                Container(
                                  height: 50.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      20.0, 0.0, 50.0, 0.0),
                                  child: Text('11:00'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      20.0, 0.0, 70.0, 0.0),
                                  child: Text('千多/水上'),
                                ),
                                Flexible(
                                  child: Container(
                                    // padding: EdgeInsets.only(right: 13.0),
                                    child: Text(
                                      '台中#00004', //我注意到＃井字號後面會直接強制省略
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // GestureDetector(
                      //   onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                      //       builder: (BuildContext context) => new PackageDetails2(missioncode: 'undelivery',))),
                      // ),
                      //
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        color: Color(0xFFA7A7A7), //#A7A7A7
                        shadowColor: Colors.blueAccent,
                        child: Visibility(
                          visible: unread,
                          child: Row(
                            children: [
                              Container(
                                height: 50.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    20.0, 0.0, 50.0, 0.0),
                                child: Text('10:00'),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    20.0, 0.0, 70.0, 0.0),
                                child: Text('千多/水上'),
                              ),
                              Flexible(
                                child: Container(
                                  // padding: EdgeInsets.only(right: 13.0),
                                  child: Text(
                                    '台中#00005', //我注意到＃井字號後面會直接強制省略
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
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
