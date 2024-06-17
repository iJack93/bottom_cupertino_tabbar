import 'package:flutter/material.dart';

import 'icon_component.dart';
import 'label_icon_component.dart';

class TabInnerItem extends StatelessWidget {
  final bool active;
  final String activeIcon;
  final String inactiveIcon;
  final Color activeColor;
  final Color inactiveColor;
  final String? label;
  final bool showLabels;

  const TabInnerItem({
    super.key,
    required this.active,
    required this.activeIcon,
    required this.inactiveIcon,
    required this.activeColor,
    required this.inactiveColor,
    this.label,
    this.showLabels = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget result = const SizedBox.shrink();
    if (showLabels && label != null) {
      // When showing labels, the icon and label are arranged in a column.
      result = LabelIconComponent(
        active: active,
        activeIcon: activeIcon,
        inactiveIcon: inactiveIcon,
        activeColor: activeColor,
        inactiveColor: inactiveColor,
        label: label!,
      );
    } else {
      // When not showing labels, only display the icon.
      result = Positioned(
          top: 16,
          child: IconComponent(
            active: active,
            activeIcon: activeIcon,
            inactiveIcon: inactiveIcon,
            activeColor: activeColor,
            inactiveColor: inactiveColor,
          )
      );
    }
    return result;
  }
}
