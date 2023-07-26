import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  final String text;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap(),
        child: Container(
          color: kPinkColor,
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Center(
            child: Text(
              text,
              style: kBigTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}

// GestureDetector(
// onTap: onTap(),
// child: Container(
// color: kPinkColor,
// height: kBottomContainerHeight,
// width: double.infinity,
// margin: const EdgeInsets.only(top: 10.0),
// padding: const EdgeInsets.only(bottom: 20.0),
// child: Center(
// child: Text(
// text,
// style: kBigTextStyle,
// ),
// ),
// ),
// );
