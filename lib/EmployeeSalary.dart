
import 'package:flutter/material.dart';

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
