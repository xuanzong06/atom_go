import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:launch_review/launch_review.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'validcode.dart';
import 'Lobby.dart';

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
