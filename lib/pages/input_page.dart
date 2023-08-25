import 'package:bmi_app/calculator.dart';
import 'package:bmi_app/components/touchable_card_content.dart';
import 'package:bmi_app/pages/results_page.dart';
import 'package:flutter/material.dart';
import '../components/bottom_button.dart';
import '../components/reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../constants.dart';

enum Gender {
  male,
  female,
  notSet,
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  InputPageState createState() => InputPageState();
}

Gender selectedGender = Gender.notSet;
int height = 170;
int weight = 65;
int age = 23;

class InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardColor: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    onPress: (() {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    }),
                    child: const IconContent(
                      icon: FontAwesomeIcons.mars,
                      text: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardColor: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    onPress: (() {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    }),
                    child: const IconContent(
                      icon: FontAwesomeIcons.venus,
                      text: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: ReusableCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: kTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumbersStyle,
                      ),
                      const Text(
                        'cm',
                        style: kTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: kGrayColor,
                      thumbColor: kPinkColor,
                      overlayColor: kPinkOpacityColor,
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 13.0),
                      overlayShape: const RoundSliderOverlayShape(
                        overlayRadius: 25.0,
                      ),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 100,
                      max: 220,
                      activeColor: kPinkColor,
                      inactiveColor: kGrayColor,
                      onChanged: (double value) {
                        setState(() {
                          height = value.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    child: TouchableCardContent(
                      onTapMinus: () {
                        setState(() {
                          weight--;
                        });
                      },
                      onTapPlus: () {
                        setState(() {
                          weight++;
                        });
                      },
                      label: 'WEIGHT',
                      variable: weight,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    child: TouchableCardContent(
                      onTapMinus: () {
                        setState(() {
                          age--;
                        });
                      },
                      onTapPlus: () {
                        setState(() {
                          age++;
                        });
                      },
                      label: 'AGE',
                      variable: age,
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            onTap: () {
              BMICalculator calc = BMICalculator(
                weight: weight,
                height: height,
              );
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultsPage(
                            numberBMI: calc.countBMI(),
                            conditionBMI: calc.returnCondition(),
                          )),
                );
              });
            },
            text: 'CALCULATE',
          ),
        ],
      ),
    );
  }
}
