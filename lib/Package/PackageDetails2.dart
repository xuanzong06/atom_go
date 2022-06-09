import 'package:atom_go/GeneralWidget/HorizontalLine.dart';
import 'package:atom_go/Kustom/KustomDrawer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../DoImagePicker.dart';

class PackageDetails2 extends StatefulWidget {
  const PackageDetails2({Key? key, required this.missioncode})
      : super(key: key);

  final String missioncode;

  @override
  _PackageDetails2State createState() =>
      _PackageDetails2State(missioncode: this.missioncode);
}

class _PackageDetails2State extends State<PackageDetails2>
    with TickerProviderStateMixin {
  // with TickerProviderStateMixin 是為了controller vsync
  var monthstr = DateFormat('MM').format(DateTime.now()).toString();
  var daystr = DateFormat('dd').format(DateTime.now()).toString();

  late TabController _tabController;

  final String missioncode;

  _PackageDetails2State({required this.missioncode});

  final _scaffoldKey =
      GlobalKey<ScaffoldState>(); //自定義IconButton.menu 需要這個值 1/3

  bool deliveryflag = true;

  String switchStatusStr = "";

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String PackageStatusStr = "未送包裹";
    String MissionDetailStr = "派車日期 ??/?? 客戶名稱 千多ＯＯ千多ＯＯ";
    var ThemeColor = Color(0xFFFFFFFF); //主題顏色
    var TextColor = Color(0xFFFFFFFF); //文字顏色
    var SwitchTextColor = Color(0xFFFFFFFF); //Switch文字顏色
    var ActiveColor = Color(0xFFFFFFFF); //Switch啟動顏色

    if (missioncode == "unpick") {
      //未取
      ThemeColor = Color(0xFFFCD69B);
      TextColor = Color(0xFFA86600);
      SwitchTextColor = Color(0xFFA86600);
      ActiveColor = Color(0xFFA86600);
      PackageStatusStr = "未取包裹";
      switchStatusStr = "未取";
    }
    if (missioncode == "picked") {
      //已取
      ThemeColor = Color(0xFFBFFFBA);
      TextColor = Color(0xFF0EA800);
      SwitchTextColor = Color(0xFF0EA800);
      ActiveColor = Color(0xFF0EA800);
      PackageStatusStr = "已取包裹";
      switchStatusStr = "已取";
    }
    if (missioncode == "undelivery") {
      //未送
      ThemeColor = Color(0xFFFADBD8);
      TextColor = Color(0xFFFF3838);
      SwitchTextColor = Color(0xFFFF3838);
      ActiveColor = Color(0xFFFF3838);
      PackageStatusStr = "未送包裹";
      switchStatusStr = "未送";
    }
    if (missioncode == "deliveried") {
      //已送
      ThemeColor = Color(0xFFBADDFF);
      TextColor = Color(0xFF00488F);
      SwitchTextColor = Color(0xFF00488F);
      ActiveColor = Color(0xFF00488F);
      PackageStatusStr = "已送包裹";
      switchStatusStr = "已送";
    }

    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey, //自定義IconButton.menu 需要這個值 2/3
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
                    color: ThemeColor,
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
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 100, 0),
                                      child: Text(
                                        PackageStatusStr,
                                        style: TextStyle(
                                          fontSize: 30.0,
                                          color: TextColor,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.zero,
                                      child: Text(
                                        switchStatusStr,
                                        style:
                                            TextStyle(color: SwitchTextColor),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: Switch(
                                          activeColor: ActiveColor,
                                          value: deliveryflag,
                                          onChanged: (value) {
                                            if (deliveryflag == false) {
                                              //只有false的時候才有功能
                                              setState(() {
                                                deliveryflag = !deliveryflag;
                                                switchStatusStr = "已送";
                                                // punchStartStr = DateFormat('HH:mm').format(DateTime.now()).toString();
                                              });
                                            }
                                          }),
                                    ),
                                  ],
                                ),
                                Text(
                                  MissionDetailStr,
                                  overflow: TextOverflow.fade,
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: TextColor,
                                  ),
                                ),
                              ],
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
                  child: Padding(
                    //製造詳細資料內縮的效果，所以之前的設計方法比較費力
                    padding: const EdgeInsets.all(30),
                    child: ListView(
                      children: [
                        Container(
                          // alignment: Alignment.centerLeft,
                          // color: Colors.yellowAccent,
                          // height: 600,
                          width: 50,
                          constraints: BoxConstraints(
                            minHeight: 200,
                            maxHeight: 500,
                          ),
                          child: TabBarView(
                            controller: _tabController,
                            children: <Widget>[
                              Column(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "取件資料",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  HorizontalLine(),
                                  Text('千多/水上_0526'),
                                  Text('嘉義水上鄉ＯＯＯＯ'),
                                  Text('580材積/1875'),
                                  Text('MAWB'),
                                  Text('HAWB'),
                                  Text('S/Ｏ 3969'),
                                  Text('系統提示 司機（ＯＯＯ）尚未取'),
                                  SizedBox(height: 20,),
                                  Text(
                                    "備註",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  HorizontalLine(),
                                  Text('貨主 博立'),
                                  Text('SO 3969'),
                                  Text('船名 WAN HAI 275 航次 V-N179'),
                                  Text('結關日 2/24'),
                                  Text('禮勝報關 0426581388'),
                                  Container(
                                    //發現這樣可以不被Column的crossu影響
                                    alignment: Alignment.bottomRight,
                                    child: FloatingActionButton(
                                      onPressed: () {},
                                      backgroundColor: ActiveColor,
                                      child: Icon(Icons.add),
                                    ),
                                  ),
                                ],
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
                                    Text("設計上傳資料1"),
                                    // DoImagePicker(),
                                    // FloatingActionButton(onPressed: (){}, child: Icon(Icons.photo_library),backgroundColor: ActiveColor,),
                                    // FloatingActionButton(onPressed: (){}, child: Icon(Icons.camera_alt),backgroundColor: ActiveColor,),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Container(
                        //   // color: Colors.teal,
                        //   height: 300,
                        //   width: 50,
                        //   child: TabBarView(
                        //     controller: _tabController,
                        //     children: <Widget>[
                        //       Center(
                        //         child: Column(
                        //           crossAxisAlignment: CrossAxisAlignment.start,
                        //           children: [
                        //             Text(
                        //               "備註",
                        //               style: TextStyle(
                        //                   fontSize: 18,
                        //                   fontWeight: FontWeight.bold),
                        //             ),
                        //             HorizontalLine(),
                        //             Text('貨主 博立'),
                        //             Text('SO 3969'),
                        //             Text('船名 WAN HAI 275 航次 V-N179'),
                        //             Text('結關日 2/24'),
                        //             Text('禮勝報關 0426581388'),
                        //             Container(
                        //               //發現這樣可以不被Column的crossu影響
                        //               alignment: Alignment.bottomRight,
                        //               child: FloatingActionButton(
                        //                 onPressed: () {},
                        //                 backgroundColor: ActiveColor,
                        //                 child: Icon(Icons.add),
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //       Center(
                        //         child: Row(
                        //           children: [
                        //             Expanded(
                        //               flex: 1,
                        //               child: Container(),
                        //             ),
                        //             Expanded(
                        //               flex: 8,
                        //               child: Column(
                        //                 children: [
                        //                   Text("備註"),
                        //                   HorizontalLine(),
                        //                   Text('data'),
                        //                 ],
                        //               ),
                        //             ),
                        //             Expanded(
                        //               flex: 1,
                        //               child: Container(),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //       Container(
                        //         alignment: Alignment.bottomRight,
                        //         child: Column(
                        //           crossAxisAlignment: CrossAxisAlignment.end,
                        //           children: [
                        //             SizedBox(
                        //               height: 20,
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
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
