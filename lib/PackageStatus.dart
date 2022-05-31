import 'package:flutter/material.dart';

//分割線
// Description：横线 參考網址：https://www.jianshu.com/p/4e1516ddcadf
class HorizontalLine extends StatelessWidget {
  final double dashedWidth;
  final double dashedHeight;
  final Color color;

  HorizontalLine({
    this.dashedHeight = 1,
    this.dashedWidth = double.infinity,
    this.color = const Color(0xFF979797),
  });

  @override
  Widget build(BuildContext context) {
    return Container(width: dashedWidth, height: dashedHeight, color: color);
  }
}

//
class PackageStatus extends StatefulWidget {
  const PackageStatus({Key? key}) : super(key: key);

  @override
  _PackageStatusState createState() => _PackageStatusState();
}

class _PackageStatusState extends State<PackageStatus> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
                                Text('車輛編號：AZ-888'),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Column(
                              children: [
                                Container(
                                  
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
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Row(
                        //使用Row，背景顏色可以拓展整個區域的畫面
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('相關公告......'),
                          Text('相關公告......'),
                        ],
                      ),
                      Row(
                        //因為範例提供之分割線會無限延伸，所以我想到用Expanded包住，來呈現範例的外觀
                        children: [
                          Expanded(
                            child: Container(),
                            flex: 1,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  'TODAY',
                                  textAlign: TextAlign.left,
                                ),
                                HorizontalLine(),
                              ],
                            ),
                            flex: 8,
                          ),
                          Expanded(
                            child: Container(),
                            flex: 1,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(),
                          ),
                          Expanded(
                            flex: 8,
                            child: Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        color: Color(0xFFFFF0D2),
                                        //自定義顏色 先找到HEX代碼：假設##FFD2F1，那帶入的時候手動改為 0xFF+FFD2F1 color:https://htmlcolorcodes.com/
                                        child: Column(
                                          // crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                  '未取',
                                                  textAlign: TextAlign.left,
                                                ),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  '30',
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                    fontSize: 100.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        color: Color(0xFFDEFFD2),
                                        //自定義顏色 先找到HEX代碼：假設##FFD2F1，那帶入的時候手動改為 0xFF+FFD2F1 color:https://htmlcolorcodes.com/
                                        child: Column(
                                          children: [
                                            Text('已取'),
                                            Container(
                                              child: Text(
                                                '02',
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                  fontSize: 100.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(),
                          ),
                          Expanded(
                            flex: 8,
                            child: Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        color: Color(0xFFFFD2F1),
                                        //自定義顏色 先找到HEX代碼：假設##FFD2F1，那帶入的時候手動改為 0xFF+FFD2F1 color:https://htmlcolorcodes.com/
                                        child: Column(
                                          children: [
                                            Text('未送'),
                                            Container(
                                              child: Text(
                                                '09',
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                  fontSize: 100.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        color: Color(0xFFD2EBFF),
                                        //自定義顏色 先找到HEX代碼：假設##FFD2F1，那帶入的時候手動改為 0xFF+FFD2F1 color:https://htmlcolorcodes.com/
                                        child: Column(
                                          children: [
                                            Text('已送'),
                                            Container(
                                              child: Text(
                                                '23',
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                  fontSize: 100.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(),
                          ),
                        ],
                      ),
                      Row(
                        //因為範例提供之分割線會無限延伸，所以我想到用Expanded包住，來呈現範例的外觀
                        children: [
                          Expanded(
                            child: Container(),
                            flex: 1,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  '未讀取',
                                  textAlign: TextAlign.left,
                                ),
                                HorizontalLine(),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        '09:00',
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        '顯示的文字訊息',
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            flex: 8,
                          ),
                          Expanded(
                            child: Container(),
                            flex: 1,
                          ),
                        ],
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
