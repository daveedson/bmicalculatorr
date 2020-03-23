import 'package:bmitracker/CalculatorFunction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../lib/Bottom_Button.dart';
import '../lib/Constants.dart';
import '../lib/Icon_Content.dart';
import '../lib/Reuseable_card.dart';
import '../lib/RoundedButton.dart';
import 'results_page.dart';

enum Gender {
  female,
  male,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 40;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI TRACKER'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: ReusableCard(
                      cardChild: IconContent(
                        icons: FontAwesomeIcons.male,
                        txt: 'MALE',
                      ),
                      colour: selectedGender == Gender.male
                          ? KcardColors
                          : kInActiveCardColor,
                    ),
                  ),
                ),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  child: ReusableCard(
                    cardChild: IconContent(
                      icons: FontAwesomeIcons.female,
                      txt: 'FEMALE',
                    ),
                    colour: selectedGender == Gender.female
                        ? KcardColors
                        : kInActiveCardColor,
                  ),
                )),
              ],
            )),
            Expanded(
                child: ReusableCard(
              colour: KcardColors,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: ktxtStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextSize,
                      ),
                      Text(
                        'cm',
                        style: ktxtStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 15.0,
                        ),
                        overlayShape: RoundSliderOverlayShape(
                          overlayRadius: 30.0,
                        )),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      activeColor: Colors.redAccent,
                      inactiveColor: Colors.blueGrey,
                      onChanged: (double newValue) {
                        height = newValue.toInt();

                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            )),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCard(
                  colour: KcardColors,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'WEIGHT',
                        style: ktxtStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberTextSize,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundedIconButton(
                            onPressed: () {
                              setState(() {
                                weight--;
                                if (weight < 0) {
                                  weight++;
                                }
                              });
                            },
                            icon: FontAwesomeIcons.minus,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundedIconButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                  if (weight < 0) {
                                    weight++;
                                  }
                                });
                              },
                              icon: FontAwesomeIcons.plus),
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(
                    child: ReusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'AGE',
                        style: ktxtStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumberTextSize,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundedIconButton(
                            onPressed: () {
                              setState(() {
                                if (age <= 1) {
                                  age++;
                                }
                                age--;
                              });
                            },
                            icon: FontAwesomeIcons.minus,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundedIconButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                  if (age <= 1) {
                                    age++;
                                  }
                                });
                              },
                              icon: FontAwesomeIcons.plus),
                        ],
                      )
                    ],
                  ),
                  colour: KcardColors,
                )),
              ],
            )),
            BottomButton(
              buttonName: 'CALCULATE',
              onTap: () {
                CalculatorFuction calc =
                    new CalculatorFuction(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return ResultsPage(
                      calculateBmi: calc.calculateBmi(),
                      resultOfBmi:calc.resultOfBmi() ,
                      getInterpritation:calc.getInterpretation() ,
                    );
                  }),
                );
              },
            )
          ],
        ));
  }
}
