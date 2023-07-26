import 'package:flutter/material.dart';
import '../constants.dart';
import 'icon_round_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TouchableCardContent extends StatelessWidget {
  const TouchableCardContent({
    super.key,
    required this.onTapPlus,
    required this.onTapMinus,
    required this.label,
    required this.variable,
  });

  final Function onTapPlus;
  final Function onTapMinus;
  final String label;
  final int variable;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: kTextStyle,
        ),
        Text(
          variable.toString(),
          style: kNumbersStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconRoundButton(
              onPressed: () {
                onTapMinus();
              },
              icon: FontAwesomeIcons.minus,
            ),
            const SizedBox(
              width: 20.0,
            ),
            IconRoundButton(
              onPressed: () {
                onTapPlus();
              },
              icon: FontAwesomeIcons.plus,
            ),
          ],
        ),
      ],
    );
  }
}
