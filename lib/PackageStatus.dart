import 'package:flutter/material.dart';

class PackageStatus extends StatefulWidget {
  const PackageStatus({Key? key}) : super(key: key);

  @override
  _PackageStatusState createState() => _PackageStatusState();
}

class _PackageStatusState extends State<PackageStatus> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
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
                                  child: Text(DateTime.now().toString()),
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

                        children: [
                          Container(
                            height: 50.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                            child: Text('未取 09:00'),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20.0, 0.0, 100.0, 0.0),
                            child: Text('千多/水上'),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                            child: Text('台中#1343546789'),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
