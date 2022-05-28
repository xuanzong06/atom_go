import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'DriverInfo.dart';

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
