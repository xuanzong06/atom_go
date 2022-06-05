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

import 'DemoP.dart';
import 'package:atom_go/AppInfomations.dart';
import 'package:atom_go/EmployeeSalary.dart';
import 'package:atom_go/PunchPage.dart';
import 'package:atom_go/WelcomePage.dart';
import 'MarquessTest.dart';
import 'LoginPage.dart';
import 'Lobby.dart';
import 'DriverInfo.dart';
import 'bottomNavigationbarTest.dart';
import 'Package/PackageStatus.dart';

import 'package:flutter/services.dart';

void main() {
  //強制畫面直立，不要轉向
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

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
      '/DemoP': (context) => const MyStatefulWidget2(),
      '/bottomNavigationbarTest': (context) => const MyStatefulWidget(),
      '/PackageStatus': (context) => const PackageStatus(),
    },
  ));
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



