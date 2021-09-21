import 'package:bmi_calc/constants.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/reusable_card.dart';
import '../components/bottom_button.dart';



class ResultPage extends StatelessWidget {
  const ResultPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Container(
            alignment: Alignment.center,
            child: Text("Your result", style: cTitleTextStyle,),
            ),
          ),
          Expanded(flex: 3,
          child: ReusableCard(
              colour: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Normal", style: cResultTextStyle,),
                  Text("20.4", style: cBMITextStyle,),
                  Text("you should eat more", style: cBodyTextStyle, textAlign: TextAlign.center,),
                ],
              ),
            ),
          ),
          BottomButton(onTap: () {
            Navigator.pop(context);
          }, buttonTitle: "RE-CALCULATE")
        ],
      ),
    );
  }
}
