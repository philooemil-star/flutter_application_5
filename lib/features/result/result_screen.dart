import 'package:flutter/material.dart';
import 'package:flutter_application_5/core/colors_manager.dart';
import 'package:flutter_application_5/core/styles_manager.dart';

class ResultScreen extends StatelessWidget {
  final double bmiResult;

  const ResultScreen({super.key, required this.bmiResult});


  String getResultText() {
    if (bmiResult >= 25) return "Overweight";
    if (bmiResult > 18.5) return "Normal";
    return "Underweight";
  }

  String getInterpretation() {
    if (bmiResult >= 25) return "You have a higher than normal body weight. Try to exercise more.";
    if (bmiResult > 18.5) return "You have a normal body weight. Good job.";
    return "You have a lower than normal body weight. You can eat a bit more.";
  }

  Color getTextColor() {
    if (bmiResult >= 25) return Colors.red;
    if (bmiResult > 18.5) return Colors.greenAccent;
    return Colors.yellow;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primaryColor,
      appBar: AppBar(
        backgroundColor: ColorsManager.primaryColor,
        elevation: 0,
        centerTitle: true,
        title:  Text("BMI Calculator", style: StylesManager.whiteBold30),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text("Your Result", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: ColorsManager.cardColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    getResultText().toUpperCase(),
                    style: TextStyle(color: getTextColor(), fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    bmiResult.toStringAsFixed(1),
                    style: const TextStyle(color: Colors.white, fontSize: 80, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      getInterpretation(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 70,
            margin: const EdgeInsets.only(top: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorsManager.bottomButtonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.pop(context); 
              },
              child:  Text("Re - Calculate", style: StylesManager.whiteBold30),
            ),
          ),
        ],
      ),
    );
  }
}