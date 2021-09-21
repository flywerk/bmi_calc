import 'package:bmi_calc/screens/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import 'result_page.dart';
import '../components/bottom_button.dart';
import '../components/round_icon_button.dart';
import 'package:bmi_calc/calculator.dart';


enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  int height = 175;
  int weight = 75;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column (
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Row(
            children: [
              Expanded(child: ReusableCard(
                onPress: () {
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },
                colour: selectedGender == Gender.male ? activeCardColor : inactiveCardColor,
                cardChild: IconContent(icon: FontAwesomeIcons.mars, label: "MALE"),
      ),),
              Expanded(child: ReusableCard(
                onPress: () {
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                colour: selectedGender == Gender.female ? activeCardColor : inactiveCardColor,
                cardChild: IconContent(icon: FontAwesomeIcons.venus, label: "FEMALE"),
    ),),
            ],
          )),
          Expanded (child: ReusableCard(
              colour: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('HEIGHT', style: TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98),)),
                  SizedBox(height: 10),
                  Row (
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text (height.toString(), style: cNumberTextStyle),

                      Text ('cm', style: cLabelTextStyle),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 100.0,
                    max: 220.0,
                    activeColor: Color(0xFFEB1555),
                    inactiveColor: Color(0xFF8D8E98),
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded (child: Row(
            children: [
              Expanded(child: ReusableCard(
              colour: activeCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("WEIGHT", style: cLabelTextStyle,),
                    SizedBox(height: 4),
                    Text(weight.toString(), style: cNumberTextStyle,),
                    SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundButtonIcon(
                          icon: FontAwesomeIcons.plus,
                            onPressed: () {
                            setState(() {
                              weight++;
                            });
                        }),
                        SizedBox(width: 10,),
                        RoundButtonIcon(icon: FontAwesomeIcons.minus,
                        onPressed: () {
                          setState(() {
                            weight--;
                          });
                        },),
                      ],
                    ),
                  ],
                ),
              ),),
              Expanded(child: ReusableCard(
                colour: activeCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("AGE", style: cLabelTextStyle,),
                    SizedBox(height: 4),
                    Text(age.toString(), style: cNumberTextStyle,),
                    SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundButtonIcon(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                            setState(() {
                            age++;
                          });
                        }),
                        SizedBox(width: 10),
                        RoundButtonIcon(icon: FontAwesomeIcons.minus,
                          onPressed: () {
                            setState(() {
                              age--;
                            });
                          },),
                      ],
                    ),
                  ],
                ),
              ),),],
            ),
          ),
          BottomButton(buttonTitle: "CALCULATE", onTap: () {
            Calculator calc = Calculator(height: height, weight: weight);
            Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(
              bmiResult: calc.calculateBMI(),
              resultText: calc.getResult(),
              interpretation: calc.getInterpretation(),
            )));
          },),
        ],
      )
    );
  }
}










