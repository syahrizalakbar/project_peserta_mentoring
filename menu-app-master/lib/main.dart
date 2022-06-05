import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menu_app/pages/pages.dart';
import 'package:menu_app/themes/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Task App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: mainBlueColor),
      home: MainPage(),
    );
  }
}
