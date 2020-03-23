import 'package:bmitracker/Bottom_Button.dart';
import 'package:bmitracker/Constants.dart';
import 'package:bmitracker/Reuseable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {@required this.resultOfBmi,
      @required this.calculateBmi,
      @required this.getInterpritation});

  final String resultOfBmi;
  final String calculateBmi;
  final String getInterpritation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI TRACKER'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20.0),
                alignment: Alignment.center,
                child: Text(
                  'Your Result',
                  style: KTitleTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                colour: KcardColors,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      resultOfBmi.toUpperCase(),
                      style: KResultTextStyle,
                    ),
                    Text(
                      calculateBmi,
                      style: KBMIText,
                    ),
                    Text(
                      getInterpritation,
                      textAlign: TextAlign.center,
                      style: KBmiResultText,
                    )
                  ],
                ),
              ),
            ),
            BottomButton(
              buttonName: 'RE-CALCUATE',
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ));
  }
}
