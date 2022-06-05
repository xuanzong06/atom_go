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