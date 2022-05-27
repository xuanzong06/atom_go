import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'validcode.dart';
import 'package:intl/intl.dart';
import 'package:marquee/marquee.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:launch_review/launch_review.dart';

void main() {
  // 自訂地的Route寫在runApp裡面
  runApp(MaterialApp(
    title: 'Named Routes Demo',
    initialRoute: '/',
    routes: {
      '/': (context) => const WelcomePage(),
      '/login': (context) => const LoginPage(),
      '/Lobby': (context) => Lobby(drivername: '', carnumber: ''),
      '/DriverInfo': (context) => DriverInfo(drivername: '', carnumber: ''),
      '/PunchPage': (context) => const PunchPage(),
      '/EmployeeSalary': (context) => const EmployeeSalary(),
      '/MaruqeeTest': (context) => const MarquessTest(),
      '/AppInfomations': (context) => const AppInfomations(),
      '/DemoP': (context) => const DemoP(),
    },
  ));
}

//依bro提供之GUI畫面設計
class DemoP extends StatefulWidget {
  const DemoP({Key? key}) : super(key: key);

  @override
  _DemoPState createState() => _DemoPState();
}

class _DemoPState extends State<DemoP> {
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
                                  '葉俊億',
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
                                  margin: EdgeInsets.only(right: 0.0),
                                  width: 150,
                                  height: 150,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    // color: Colors.teal,
                                    image: DecorationImage(
                                      image:
                                          AssetImage('assets/seastco_icon.png'),
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
                    ],
                  ),
                ),
              ), //全畫面的方法
              Expanded(
                flex: 7,
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
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  '30',
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                      fontSize: 50.0,
                                                      fontWeight: FontWeight.bold),
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
                                                    fontSize: 50.0,
                                                    fontWeight:
                                                        FontWeight.bold),
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
                                                    fontSize: 50.0,
                                                    fontWeight:
                                                        FontWeight.bold),
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
                                                    fontSize: 50.0,
                                                    fontWeight:
                                                        FontWeight.bold),
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

//App資訊
class AppInfomations extends StatefulWidget {
  const AppInfomations({Key? key}) : super(key: key);

  @override
  State<AppInfomations> createState() => _AppInfomationsState();
}

class _AppInfomationsState extends State<AppInfomations> {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  Widget _infoTile(String title, String subtitle) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle.isEmpty ? 'Not set' : subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('應用程式資訊'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _infoTile('App name', _packageInfo.appName),
            _infoTile('Package name', _packageInfo.packageName),
            _infoTile('App version', _packageInfo.version),
            _infoTile('Build number', _packageInfo.buildNumber),
            _infoTile('Build signature', _packageInfo.buildSignature),
          ],
        ),
      ),
    );
  }
}

//跑馬燈（已應用在功能選單畫面）
class MarquessTest extends StatefulWidget {
  const MarquessTest({Key? key}) : super(key: key);

  @override
  _MarquessTestState createState() => _MarquessTestState();
}

class _MarquessTestState extends State<MarquessTest> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('跑馬燈測試'),
        ),
        body: ListView(
          padding: EdgeInsets.only(top: 5.0),
          children: [
            _buildSimpleMarquee(),
          ].map(_wrapWithStuff).toList(),
        ),
      ),
    );
  }
}

Widget _buildSimpleMarquee() {
  bool _useRtlText = false;
  return Marquee(
    key: Key("$_useRtlText"),
    text: !_useRtlText
        ? '這是跑馬燈測試中會顯示的文字                                                  '
        : 'פעם היה ילד אשר סיפר סיפור על ילד:"',
    velocity: 50.0,
  );
}

Widget _wrapWithStuff(Widget child) {
  //在ListView中呼叫這個finction，將自定義Widget融入到ListView中
  return Padding(
    padding: EdgeInsets.all(16.0),
    child: Container(height: 20.0, color: Colors.white, child: child),
  );
}

//員工薪資
class EmployeeSalary extends StatefulWidget {
  const EmployeeSalary({Key? key}) : super(key: key);

  @override
  _EmployeeSalaryState createState() => _EmployeeSalaryState();
}

class _EmployeeSalaryState extends State<EmployeeSalary> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('薪資訊息'),
        ),
        body: Column(
          children: [
            Container(
              child: Text('薪資頁面訊息建立中...'),
            )
          ],
        ),
      ),
    );
  }
}

//打卡
class PunchPage extends StatefulWidget {
  const PunchPage({Key? key}) : super(key: key);

  @override
  _PunchPageState createState() => _PunchPageState();
}

class _PunchPageState extends State<PunchPage> {
  // var nowtime = DateTime.now();
  var nowtime =
      DateFormat('yyyy/MM/dd HH:mm:ss').format(DateTime.now()).toString();

  void PunchOn() {
    nowtime = DateFormat('yyyy/MM/dd HH:mm:ss')
        .format(DateTime.now())
        .toString(); // 取得觸發作業當下的時間
  }

  void PunchDown() {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('打卡'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //比例呈現的範例
            Expanded(
              flex: 5,
              child: Container(
                // color: Colors.green,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        OutlinedButton(
                          onPressed: () {},
                          child: Text('上班打卡'),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 0.0),
                          child: Text('今天日期：' + nowtime),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 0.0),
                          child: Text('上班打卡時間：'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            //比例呈現的範例
            Expanded(
              flex: 5,
              child: Container(
                // color: Colors.green,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        OutlinedButton(
                          onPressed: () {},
                          child: Text('下班打卡'),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 0.0),
                          child: Text('今天日期：' + nowtime),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 0.0),
                          child: Text('下班打卡時間：'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            //比例呈現的範例 END
            // OutlinedButton(
            //   onPressed: () {
            //   },
            //   child: Text('上班打卡'),
            // ),
            // OutlinedButton(
            //   onPressed: () {
            //   },
            //   child: Text('下班打卡'),
            // ),
          ],
        ),
      ),
    );
  }
}

//司機資料顯示與編輯
class DriverInfo extends StatefulWidget {
  const DriverInfo(
      {Key? key, required this.drivername, required this.carnumber})
      : super(key: key);
  final String drivername;
  final String carnumber;

  @override
  _DriverInfoState createState() =>
      _DriverInfoState(drivername: this.drivername, carnumber: this.carnumber);
}

class _DriverInfoState extends State<DriverInfo> {
  //接收來自上一個頁面的值
  final String drivername;
  final String carnumber;
  TextEditingController _drivernameController = TextEditingController();
  TextEditingController _carnumberController = TextEditingController();

  _DriverInfoState({required this.drivername, required this.carnumber});

  @override
  void initState() {
    _drivernameController.text = drivername;
    _carnumberController.text = carnumber;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('司機個人資料維護'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text('司機名稱：'),
                Flexible(
                  //使用Flexible Widget，避免TextField太寬，畫面無法呈現結果
                  child: TextField(
                    controller: _drivernameController,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: '司機名稱',
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text('駕駛車號：'),
                Flexible(
                  child: TextField(
                    controller: _carnumberController,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: '駕駛車號',
                    ),
                  ),
                ),
              ],
            ),
            OutlinedButton(
              onPressed: () {},
              child: Text('編輯'),
            ),
          ],
        ),
      ),
    );
  }
}

//登入後畫面，功能選單
class Lobby extends StatefulWidget {
  //從這邊開始都要撰寫接值的功能
  const Lobby({Key? key, required this.drivername, required this.carnumber})
      : super(key: key);
  final String drivername;
  final String carnumber;

  @override
  _LobbyState createState() =>
      _LobbyState(drivername: this.drivername, carnumber: this.carnumber);
}

class _LobbyState extends State<Lobby> {
  //接收來自上一個頁面的值
  final String drivername;
  final String carnumber;

  _LobbyState({required this.drivername, required this.carnumber});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('（暫時）功能選單'),
        ),
        body: Column(
          children: [
            Container(
              //將跑馬燈應用在其他畫面，要研究是否必須透過Container才可以顯示
              height: 50.0,
              child: ListView(
                padding: EdgeInsets.only(top: 5.0),
                children: [
                  _buildSimpleMarquee(),
                ].map(_wrapWithStuff).toList(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () {
                    // Navigator.pushNamed(context, '/DriverInfo');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DriverInfo(
                          drivername: drivername,
                          carnumber: carnumber,
                        ),
                      ),
                    );
                  },
                  child: Text('司機個人資料維護'),
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/PunchPage');
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => DriverInfo(
                    //       drivername: drivername,
                    //       carnumber: carnumber,
                    //     ),
                    //   ),
                    // );
                  },
                  child: Text('打  卡  功  能'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/EmployeeSalary');
                  },
                  child: Text('薪資查詢'),
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/EmployeeSalary');
                  },
                  child: Text('... '),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/EmployeeSalary');
                  },
                  child: Text('司機定位查詢'),
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/AppInfomations');
                  },
                  child: Text('系統資訊'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/MaruqeeTest');
                  },
                  child: Text('跑馬燈'),
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/EmployeeSalary');
                  },
                  child: Text('...'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//登入含驗證碼司機（登入成功與失敗）
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //宣告參數
  TextEditingController _account = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _code = TextEditingController();
  String _result1 = "";
  String _result2 = "";
  String _validcode = "";
  String _loginResult = "";

  String validcode() {
    //亂數產生
    int validcode = Random().nextInt(999999);
    _validcode = validcode.toString();
    print("CREATE!!!!!!!!!!!: " + validcode.toString());
    return validcode.toString();
  }

  @override
  void initState() {
    super.initState();
    getAppVersion();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text('Login Page'),
        // ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/wallpaper.jpg'), //自己測試背景圖片
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.7), //加上一層透明0.5的黑
                  BlendMode.dstATop //混合模式，放到上面去
                  ),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 150,
                height: 150,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  // color: Colors.teal,
                  image: DecorationImage(
                    image: AssetImage('assets/seastco_icon.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(1000.0),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color.fromRGBO(255, 255, 255,
                      0.5), //如果今天我有定義decoration屬性，color屬性要從Container層級移到BoxDecoration裡面，不然程式會出錯
                ),
                margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                height: 325.0,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50.0, 30.0, 50.0, 0.0),
                      child: TextField(
                        textAlign: TextAlign.center,
                        controller: _account,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'USERNAME',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 0.0),
                      child: TextField(
                        textAlign: TextAlign.center,
                        controller: _password,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'PASSWORD',
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(50.0, 10.0, 0.0, 0.0),
                            child: Container(
                              width: 175.0,
                              child: TextField(
                                textAlign: TextAlign.center,
                                controller: _code,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: '請輸入驗證碼',
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(0.0, 10.0, 50.0, 0.0),
                          child: Container(
                            child: HBCheckCode(
                                code: validcode(),
                                backgroundColor: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 0.0),
                      child: OutlinedButton(
                        onPressed: () {
                          //取得結果改變Text內容，要用setState
                          _loginTx();
                        },
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.grey[800],
                          minimumSize: const Size(200, 50),
                          shape: StadiumBorder(),
                          side: BorderSide(
                            width: 0,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ),
                    Text(_loginResult),
                  ],
                ),
              ),

              // Text(_result1),
              // Text(_result2),
            ],
          ),
        ),
      ),
    );
  }

  _loginTx() {
    String account = _account.text;
    String password = _password.text;
    String code = _code.text;
    if (account == "" || password == "") {
      //驗證沒輸入的提示，請參考文章：https://stackoverflow.com/questions/53424916/textfield-validation-in-flutter
      // } else if (_validcode == _code.text) {
    } else if (true) {
      //開發中，跳過驗證碼的方法
      print("_validcode == _code.text");
      loginTx(_account.text, _password.text);
      setState(() {
        _loginResult = "登入成功";
      });
    } else {
      setState(() {
        _loginResult = "登入失敗，請檢查帳號密碼及輸入的驗證碼";
      });
    }
  }

  Future<void> loginTx(String Account, String Password) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = "login";
      map['account'] = Account;
      map['password'] = Password;
      final response = await http.post(
          Uri.parse('http://shyecheng.new.n9s.com/driverlocate.php'),
          body: map);
      // final response = await http.post(Uri.parse('http://192.168.31.167:8888/driverlocate.php'),
      //     body: map);
      if (200 == response.statusCode) {
        //處理回傳結果
        String result = response.body;
        result = result.replaceAll("Connect Success", ""); //處理掉連線成功的訊息，僅剩下回傳的訊息
        List<String> resultList = result.split(',');
        setState(() {
          //使用setState去改變畫面的值
          // print(resultList[0]); //司機姓名
          _result1 = resultList[0]; //目前無法接到資料時，直接改變畫面的value
          // print("司機姓名：" + _result1);
          // print(resultList[1]); //駕駛車號
          _result2 = resultList[1]; //目前無法接到資料時，直接改變畫面的value
          // print("駕駛車號：" + _result2);
        });

        if (_result1 != "" || _result2 != "") {
          //這邊要判斷有沒有登入成功。
          print("登入成功");
          // Navigator.of(context).pushNamedAndRemoveUntil('/Lobby', (Route<dynamic> route) => false);
          //20220509 因為回上一頁就會關閉程式，要研究是否提示登出等訊息。
          //試試看這樣可不可以-->可以!! //傳值，並且關閉之前的畫面。
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => Lobby(
                        drivername: _result1,
                        carnumber: _result2,
                      )),
              (route) => false);
        } else {}
      } else {
        print('error');
      }
    } catch (e) {
      print('error : ' + e.toString());
    }
  }

  //檢查版本更新與跳出警告視窗
  void _showDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false, //禁止使用者觸控其他地方以關閉訊息提示
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("新版本發佈"),
          content: new Text("請前往商店更新"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                LaunchReview.launch(
                  androidAppId: "com.seachaunt.seastco",
                  // iOSAppId: "585027354"
                );
              },
            ),
          ],
        );
      },
    );
  }

  Future<String> getAppVersion() async {
    //先取得App的資訊
    PackageInfo _packageInfo = PackageInfo(
      appName: 'Unknown',
      packageName: 'Unknown',
      version: 'Unknown',
      buildNumber: 'Unknown',
      buildSignature: 'Unknown',
    );
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });

    print(_packageInfo.appName);
    print(_packageInfo.version);

    try {
      var map = Map<String, dynamic>();
      map['action'] = "getAppVersion";
      map['appname'] = _packageInfo.appName;
      final response = await http
          .post(Uri.parse('http://192.168.31.167:8888/atom.php'), body: map);
      print(response.body);
      // map[''] = "";
      if (response.body.toString() != _packageInfo.version) {
        //版本不相同時跳到商店 20220516
        //版本更新訊息提示

        setState(() {
          _showDialog(context);
        });
        // LaunchReview.launch(androidAppId: "com.seachaunt.seastco",
        //     // iOSAppId: "585027354"
        // );
      }

      return "ok";
    } catch (Exception) {
      return "not ok";
    }
  }
}

//首頁（公司logo/與gif動畫圖放入）
class WelcomePage extends StatefulWidget {
  //app開始顯示公司logo 或 gif動畫
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    // getAppVersion();
  }

  @override
  Widget build(BuildContext context) {
    //用參數的方式給值
    String showtext = "Company Welcome Page";

    // 設置timer 時間到的時候自動切換頁面
    // 這個方法不能轉畫面，有錯誤；開始學習使用routes切換頁面
    Timer(const Duration(seconds: 3), () {
      print("3秒到");
      // Navigator.pushNamed(context, '/login');

      Navigator.of(context)
          .pushNamedAndRemoveUntil('/DemoP', (Route<dynamic> route) => false);
      // .pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
    });

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/wallpaper.jpg'), //自己測試背景圖片
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), //加上一層透明0.5的黑
                  BlendMode.dstATop //混合模式，放到上面去
                  ),
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 100.0,
              ),
              Container(
                width: 150,
                height: 150,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  // color: Colors.teal,
                  image: DecorationImage(
                    image: AssetImage('assets/seastco_icon.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(1000.0),
                ),
              ),
              Center(
                child: Text('$showtext'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
