import 'dart:async';

import 'package:flutter/material.dart';


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
