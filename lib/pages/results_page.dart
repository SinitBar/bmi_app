import 'package:bmi_app/constants.dart';
import 'package:flutter/material.dart';

import '../components/bottom_button.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({
    super.key,
    required this.numberBMI,
    required this.conditionBMI,
  });

  final String numberBMI;
  final String conditionBMI;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your results'),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  conditionBMI,
                  style: kBigGreenTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Text(
                numberBMI,
                style: kBigNumbersStyle,
              ),
            ),
            BottomButton(
              onTap: () {
                Navigator.pop(context);
              },
              text: 'RE-CALCULATE',
            ),
          ],
        ),
      ),
    );
  }
}
