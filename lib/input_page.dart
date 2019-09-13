import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'result_page.dart';
import 'calculator_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender gender;
  int height = 180;
  int weight = 60;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: gender == Gender.male
                        ? kReusableActiveCardColor
                        : kReusableInactiveCardColor,
                    child: IconContent(FontAwesomeIcons.mars, 'MALE'),
                    onTap: () {
                      setState(() {
                        gender = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: gender == Gender.female
                        ? kReusableActiveCardColor
                        : kReusableInactiveCardColor,
                    child: IconContent(FontAwesomeIcons.venus, 'FEMALE'),
                    onTap: () {
                      setState(() {
                        gender = Gender.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: kReusableActiveCardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'HEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              height.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              'cm',
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderThemeData().copyWith(
                            thumbShape: RoundSliderThumbShape(
                              enabledThumbRadius: 10.0,
                            ),
                            overlayShape: RoundSliderOverlayShape(
                              overlayRadius: 20.0,
                            ),
                            thumbColor: Color(0XFFEB1555),
                            overlayColor: Color(0X29EB1555),
                            activeTrackColor: Colors.white,
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            min: 120.0,
                            max: 220.0,
                            inactiveColor: Color(0XFF8D8E98),
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: kReusableActiveCardColor,
                    child: Column(
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: FlatButton(
                                color: Color(0XFF4C4F5E),
                                shape: CircleBorder(
                                    side: BorderSide(
                                  width: 10.0,
                                  color: Color(0XFF4C4F5E),
                                )),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ),
                            Expanded(
                              child: FlatButton(
                                color: Color(0XFF4C4F5E),
                                shape: CircleBorder(
                                    side: BorderSide(
                                  width: 10.0,
                                  color: Color(0XFF4C4F5E),
                                )),
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kReusableActiveCardColor,
                    child: Column(
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: FlatButton(
                                color: Color(0XFF4C4F5E),
                                shape: CircleBorder(
                                    side: BorderSide(
                                  width: 10.0,
                                  color: Color(0XFF4C4F5E),
                                )),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ),
                            Expanded(
                              child: FlatButton(
                                color: Color(0XFF4C4F5E),
                                shape: CircleBorder(
                                  side: BorderSide(
                                    width: 10.0,
                                    color: Color(0XFF4C4F5E),
                                  ),
                                ),
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    CalculatorBrain calc =
                        CalculatorBrain(weight: weight, height: height);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultPage(
                                resultText: calc.calculateBMI(),
                                bmiResult: calc.getResult(),
                                description: calc.getInterpretation(),
                              )),
                    );
                  },
                  child: Container(
                    child: Center(
                      child: Text(
                        'CALCULATE',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    color: kBottomContainerColor,
                    margin: EdgeInsets.only(top: 10),
                    height: 40,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
