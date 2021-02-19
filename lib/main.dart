import 'package:flutter/material.dart';
import 'package:yum_yum/dashboardPage.dart';

void main() {
  runApp(YumYum());
}

class YumYum extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardPage(),
    );
  }
}
