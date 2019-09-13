import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'reusable_card.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String description;
  ResultPage(
      {@required this.bmiResult,
      @required this.description,
      @required this.resultText});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Text(
              'Your Result',
              style: kNumberTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 6,
            child: ReusableCard(
              color: kReusableActiveCardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    bmiResult.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    resultText,
                    style: kBMITextStyle,
                  ),
                  Text(
                    description,
                    style: kBodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Center(
                child: Text(
                  'RE-CALCULATE',
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
        ],
      ),
    );
  }
}
