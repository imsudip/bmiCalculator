import 'package:bmi/bmipage.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: NeumorphicTheme(
        usedTheme: UsedTheme.LIGHT, //or DARK / SYSTEM
        darkTheme: NeumorphicThemeData(
          baseColor: Color(0xff333333),
          accentColor: Colors.green,
          lightSource: LightSource.topLeft,
          depth: 4,
          intensity: 0.3,
        ),
        theme: NeumorphicThemeData(
          baseColor: Color(0xffD9dfea),
          accentColor: Color(0xff1cb9cb),
          lightSource: LightSource.topLeft,
          depth: 6,
          intensity: 0.5,
        ),
        child: BmiPage(),
      ),
    );
  }
}
