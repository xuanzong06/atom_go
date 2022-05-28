import 'package:flutter/material.dart';

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
