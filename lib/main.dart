import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'validcode.dart';

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
    },
  ));
}

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

  // @override
  // void initState(){
  //   setState(() {
  //
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('（暫時）功能選單'),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}

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
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Login Page'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 0.0),
              child: TextField(
                controller: _account,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: '請輸入帳號',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 0.0),
              child: TextField(
                controller: _password,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: '請輸入密碼',
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(50.0, 10.0, 0.0, 0.0),
                    child: Container(
                      width: 175.0,
                      child: TextField(
                        controller: _code,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          hintText: '請輸入驗證碼',
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 10.0, 50.0, 0.0),
                  child: Container(
                    child: HBCheckCode(
                        code: validcode(), backgroundColor: Colors.amber),
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
                child: Text('送出'),
              ),
            ),
            Text(_loginResult),
            // Text(_result1),
            // Text(_result2),
          ],
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
    } else if (_validcode == _code.text) {
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
}

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
          .pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
    });

    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Center(
                child: Text('$showtext'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
