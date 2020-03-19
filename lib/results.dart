import 'package:flutter/material.dart';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';

Color bg = Color(0xffD9dfea);
String comment = "";
String headline = "";

class ResultPage extends StatelessWidget {
  final int height;
  final int weight;

  ResultPage({this.height, this.weight});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
          elevation: 0,
          title: Text(
            'YOUR RESULT',
            style: TextStyle(
                color: NeumorphicColors.darkVariant,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          backgroundColor: Colors.transparent,
          leading: Container(
            margin: EdgeInsets.all(6),
            child: NeumorphicButton(
              onClick: () => Navigator.of(context).pop(),
              child: Icon(Icons.arrow_back_ios),
              boxShape: NeumorphicBoxShape.circle(),
              style: NeumorphicStyle(color: Colors.deepOrangeAccent),
            ),
          )),
      body: Result(this.height, this.weight),
    );
  }
}

class Result extends StatefulWidget {
  final int height;
  final int weight;

  Result(this.height, this.weight);

  @override
  _ResultState createState() => _ResultState();
}
 bmiResult(h, w) {
      double bmi = (w / (h * h)) * 10000;

      if (bmi < 18.5) {
        comment = "You are under Weight";
        headline = "UNDERWEIGHT";
      } else if (bmi >= 18.5 && bmi < 25) {
        comment = "You are at a healthy weight.";
        headline = "NORMAL";
      } else if (bmi > 25 && bmi <= 29.99) {
        comment = "You are at overweight.";
        headline = "OVERWEIGHT";
      } else {
        comment = "You are obese.";
        headline = "OBESE";
      }
      
      print(headline);
      return bmi.round();
    }
class _ResultState extends State<Result> {
  var score;
  @override
  void initState() {
    score=bmiResult(this.widget.height, this.widget.weight);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var theme = NeumorphicTheme.currentTheme(context);

    TextStyle headlines = TextStyle(
        letterSpacing: 2.0, fontSize: 18, color: Colors.lightBlue[600]);
    TextStyle boldNumber = TextStyle(
        color: NeumorphicColors.darkVariant,
        fontWeight: FontWeight.bold,
        fontSize: 50.0);

   

    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width * 0.9,
            // margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.all(20.0),

            child: Neumorphic(
              style: NeumorphicStyle(
                  shape: NeumorphicShape.flat,
                  depth: 7,
                  intensity: 0.5,
                  color: bg),
              boxShape: NeumorphicBoxShape.roundRect(
                  borderRadius: BorderRadius.circular(30.0)),
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("$headline", style: headlines),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                        '$score',
                        style: boldNumber.copyWith(
                            fontSize: 80, letterSpacing: 0)),
                  ),
                  Column(
                    children: <Widget>[
                      Text('Normal BMI range:',style: headlines.copyWith(fontSize: 18,color: Colors.deepOrangeAccent,letterSpacing: 0.8,fontWeight: FontWeight.bold),),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "18.5 - 25 kg/m",
                          style: headlines,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '$comment',
                      style: headlines,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Container(
                margin: EdgeInsets.all(10),
                child: NeumorphicButton(
                  // padding: EdgeInsets.all(8),
                  boxShape: NeumorphicBoxShape.stadium(),
                  style: NeumorphicStyle(
                      color: Colors.deepOrangeAccent,
                      shape: NeumorphicShape.concave,
                      intensity: 0.55,
                      depth: -8),
                  onClick: () =>Navigator.of(context).pop(),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Center(
                        child: Text(
                      "RE-CALCULATE BMI",
                      style: TextStyle(
                          color: bg,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2),
                    )),
                  ),
                ),
              )
      ],
    );
  }
}
