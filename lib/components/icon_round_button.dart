import 'package:flutter/material.dart';

class IconRoundButton extends RawMaterialButton {
  const IconRoundButton({
    super.key,
    required super.onPressed,
    required this.icon,
  });
  final IconData? icon;
  @override
  double get elevation => 6.0;
  @override
  Widget? get child => Icon(icon);
  @override
  BoxConstraints get constraints =>
      const BoxConstraints(minWidth: 50.0, minHeight: 50.0);
  @override
  Color? get fillColor => const Color(0xFF4C4F5E);
  @override
  ShapeBorder get shape => const CircleBorder();
//RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0));
}
