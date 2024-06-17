import 'package:bottom_cupertino_tabbar/src/tabbar_components/label_component.dart';
import 'package:flutter/material.dart';

import 'icon_component.dart';

class LabelIconComponent extends StatelessWidget {

  final bool active;
  final String activeIcon;
  final String inactiveIcon;
  final Color activeColor;
  final Color inactiveColor;
  final String label;

  const LabelIconComponent({
    super.key,
    required this.active,
    required this.activeIcon,
    required this.inactiveIcon,
    required this.activeColor,
    required this.inactiveColor,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // The icon itself, using an SVG image.
          IconComponent(
            active: active,
            activeIcon: activeIcon,
            inactiveIcon: inactiveIcon,
            activeColor: activeColor,
            inactiveColor: inactiveColor,
          ),
          // The label text positioned below the icon.
          LabelComponent(
            label: label,
            active: active,
            activeColor: activeColor,
            inactiveColor: inactiveColor
          ),
        ],
      ),
    );
  }
}
