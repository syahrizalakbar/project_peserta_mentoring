import 'package:flutter_kalkulatorbmi/shared/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kalkulatorbmi/modules/bmi_result/bmi_result_screen.dart';
import 'package:flutter_kalkulatorbmi/modules/bmi/bmi_screen.dart';
import 'package:flutter_kalkulatorbmi/modules/screens/register.dart';

void main() {
  // Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

//Stateless
//Stateful

//class MyApp

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PageLogin(),
    );
  }

}


