import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

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