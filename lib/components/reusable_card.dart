import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color cardColor;
  final Widget child;
  final Function? onPress;

  const ReusableCard({
    super.key,
    this.cardColor = const Color(0xFF1D1E33),
    this.child = const SizedBox(
      width: double.infinity,
      height: double.infinity,
    ),
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (onPress != null) {
            onPress!();
          }
        },
        child: Container(
          margin: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: child,
        ));
  }
}
