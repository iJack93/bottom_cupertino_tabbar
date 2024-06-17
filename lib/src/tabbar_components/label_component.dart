import 'package:flutter/material.dart';

class LabelComponent extends StatelessWidget {
  final String label;
  final bool active;
  final Color activeColor;
  final Color inactiveColor;

  const LabelComponent({
    super.key,
    required this.label,
    required this.active,
    required this.activeColor,
    required this.inactiveColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 4, 0, 0),
      child: Text(
        label,
        style: TextStyle(
            color: active ? activeColor : inactiveColor, fontSize: 11),
      ),
    );
  }
}
