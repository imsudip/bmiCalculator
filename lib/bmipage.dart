import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:bmi/results.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class BmiPage extends StatefulWidget {
  @override
  _BmiPageState createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {
  int age = 17;
  int weight = 50;

  int height = 180;
  double maxHeight = 220;
  double minHeight = 120;

  bool isMale = true;
  toggleGender() {
    setState(() {
      isMale = !isMale;
    });
  }

  ageIncrement() {
    setState(() {
      age++;
    });
  }

  ageDecrement() {
    setState(() {
      age--;
    });
  }

  weightIncrement() {
    setState(() {
      weight++;
    });
  }

  weightDecrement() {
    setState(() {
      weight--;
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = NeumorphicTheme.currentTheme(context);

    TextStyle headlines =
        TextStyle(letterSpacing: 2.0, fontSize: 15, color: theme.accentColor);
    TextStyle boldNumber = TextStyle(
        color: NeumorphicColors.darkVariant,
        fontWeight: FontWeight.bold,
        fontSize: 50.0);
    TextStyle secondaryButtonColorStyle = TextStyle(
        color: theme.accentColor, fontWeight: FontWeight.bold, fontSize: 26.0);
    TextStyle primaryButtonStyle = TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.normal,
        letterSpacing: 1,
        wordSpacing: 2,
        color: theme.accentColor);
    Widget _heightWidget() => Container(
          margin: EdgeInsets.all(10.0),
          height: MediaQuery.of(context).size.height * 0.25,
          child: Neumorphic(
            style: NeumorphicStyle(
                shape: NeumorphicShape.flat,
                depth: 4,
                intensity: 0.4,
                color: theme.baseColor),
            boxShape: NeumorphicBoxShape.roundRect(
                borderRadius: BorderRadius.circular(25.0)),
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('HEIGHT', style: headlines),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text.rich(TextSpan(
                      text: "$height",
                      style: boldNumber,
                      children: [
                        TextSpan(
                            text: "cm",
                            style: boldNumber.copyWith(fontSize: 20))
                      ])),
                ),
                Expanded(
                  child: NeumorphicSlider(
                    value: height.toDouble() - 120,
                    min: 0,
                    max: 100,
                    // height: 10.0,
                    style: SliderStyle(
                        depth: -5.0,
                        borderRadius: 8.0,
                        accent: theme.accentColor,
                        variant: Colors.blueAccent),
                    // activeColor: Colors.orangeAccent,
                    // inactiveColor: Colors.black,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round() + 120;
                      });
                    },
                  ),
                )
              ],
            ),
          ),
        );

    return Scaffold(
      //backgroundColor: theme.baseColor,
      body: SafeArea(
        child: NeumorphicBackground(
          padding: EdgeInsets.symmetric(horizontal: 10),
          backendColor: theme.baseColor,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(right: 10),
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: NeumorphicButton(
                        onClick: toggleGender,
                        minDistance: 0,
                        style: NeumorphicStyle(
                            shape: NeumorphicShape.flat,
                            depth: isMale ? 4 : -4,
                            intensity: 0.4,
                            color: isMale
                                ? theme.baseColor
                                : NeumorphicColors.embossMaxDarkColor
                                    .withOpacity(0.04)),
                        boxShape: NeumorphicBoxShape.roundRect(
                            borderRadius: BorderRadius.circular(25.0)),
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'images/male.png',
                              height: MediaQuery.of(context).size.height * 0.1,
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text('MALE',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.lightBlueAccent))
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: NeumorphicButton(
                        onClick: toggleGender,
                        minDistance: 0,
                        style: NeumorphicStyle(
                            shape: NeumorphicShape.flat,
                            depth: !isMale ? 4 : -4,
                            intensity: 0.4,
                            color: !isMale
                                ? theme.baseColor
                                : NeumorphicColors.embossMaxDarkColor
                                    .withOpacity(0.04)),
                        boxShape: NeumorphicBoxShape.roundRect(
                            borderRadius: BorderRadius.circular(25.0)),
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'images/female.png',
                              height: MediaQuery.of(context).size.height * 0.1,
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text('FEMALE',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.redAccent))
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                  flex: 1,
                  child: FlipCard(
                      flipOnTouch: false,
                      front: _heightWidget(),
                      back: Container())),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: Neumorphic(
                        style: NeumorphicStyle(
                            shape: NeumorphicShape.flat,
                            depth: 4,
                            intensity: 0.4,
                            color: theme.baseColor),
                        boxShape: NeumorphicBoxShape.roundRect(
                            borderRadius: BorderRadius.circular(25.0)),
                        //padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('WEIGHT', style: headlines),
                            Text.rich(TextSpan(
                                text: "$weight",
                                style: boldNumber,
                                children: [
                                  TextSpan(
                                      text: "kg",
                                      style: boldNumber.copyWith(fontSize: 20))
                                ])),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                  height: 40,
                                  width: 40,
                                  child: NeumorphicButton(
                                    style: NeumorphicStyle(depth: 4),
                                    onClick: weightDecrement,
                                    boxShape: NeumorphicBoxShape.circle(),
                                    child: Center(
                                      child: Text(
                                        "-",
                                        style: secondaryButtonColorStyle,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 40,
                                  width: 40,
                                  child: NeumorphicButton(
                                    style: NeumorphicStyle(depth: 4),
                                    onClick: weightIncrement,
                                    boxShape: NeumorphicBoxShape.circle(),
                                    child: Center(
                                      child: Text(
                                        "+",
                                        style: secondaryButtonColorStyle,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: Neumorphic(
                        style: NeumorphicStyle(
                            shape: NeumorphicShape.flat,
                            depth: 4,
                            intensity: 0.4,
                            color: theme.baseColor),
                        boxShape: NeumorphicBoxShape.roundRect(
                            borderRadius: BorderRadius.circular(25.0)),
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('AGE', style: headlines),
                            Text.rich(TextSpan(
                    text: "$age",
                    style: boldNumber,
                    children: [
                      TextSpan(text: "yrs",style: boldNumber.copyWith(fontSize: 17) )
                    ]
                  )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                  height: 40,
                                  width: 40,
                                  child: NeumorphicButton(
                                    style: NeumorphicStyle(depth: 4),
                                    onClick: ageDecrement,
                                    boxShape: NeumorphicBoxShape.circle(),
                                    child: Center(
                                      child: Text(
                                        "-",
                                        style: secondaryButtonColorStyle,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 40,
                                  width: 40,
                                  child: NeumorphicButton(
                                    style: NeumorphicStyle(depth: 4),
                                    onClick: ageIncrement,
                                    boxShape: NeumorphicBoxShape.circle(),
                                    child: Center(
                                      child: Text(
                                        "+",
                                        style: secondaryButtonColorStyle,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
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
                  onClick: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultPage(
                                height: height,
                                weight: weight,
                              ))),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Center(
                        child: Text(
                      "CALCULATE BMI",
                      style: TextStyle(
                          color: theme.baseColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2),
                    )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
