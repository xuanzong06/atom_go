import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'GeneralWidget/HorizontalLine.dart';
import 'Kustom/KustomDrawer.dart';

class PersonalPage extends StatefulWidget {
  const PersonalPage({Key? key}) : super(key: key);

  @override
  _PersonalPageState createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> with TickerProviderStateMixin{
  final _scaffoldKey =
      GlobalKey<ScaffoldState>(); //自定義IconButton.menu 需要這個值 1/3

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
        key: _scaffoldKey, //自定義IconButton.menu 需要這個值 2/3
        drawer: Drawer(
          child: KustomDrawer(),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 4,
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
                                  //發現這樣可以不被Column的crossu影響
                                  alignment: Alignment.bottomRight,
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.more_horiz),
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
                                  '劉思慕',
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
                                  margin: EdgeInsets.only(right: 0.0),
                                  width: 100,
                                  height: 100,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    // color: Colors.teal,
                                    image: DecorationImage(
                                      image: AssetImage('assets/liu.png'),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(1000.0),
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
                            padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
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
                                        text: '司機資料',
                                      ),
                                      Tab(
                                        // icon: Icon(Icons.beach_access_sharp),
                                        text: '本月打卡',
                                      ),
                                      Tab(
                                        // icon: Icon(Icons.brightness_5_sharp),
                                        text: '上月薪資',
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
                                  "司機基本資料",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                HorizontalLine(),
                                Text('姓名：劉思慕'),
                                Text('聯絡手機：0919123456'),
                                Text('聯絡地址：上鄉ＯＯＯＯ'),
                                Text('580材積/1875'),
                                Text('MAWB'),
                                Text('HAWB'),
                                Text('S/Ｏ 3969'),
                                Text('(更新請告知公司)'),
                              ],
                            ),
                            Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "本月打卡（隔月更新）",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                HorizontalLine(),
                                Row(children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(40,0,20,0),
                                    child: Text('日期'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(10,0,20,0),
                                    child: Text('上班打卡'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(10,0,20,0),
                                    child: Text('下班打卡'),
                                  ),
                                ],),
                              ],
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
