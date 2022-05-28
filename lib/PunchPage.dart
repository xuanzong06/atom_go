import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



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
