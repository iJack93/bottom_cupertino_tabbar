import 'package:flutter/material.dart';

import 'icon_component.dart';
import 'label_icon_component.dart';

class TabInnerItem extends StatelessWidget {
  /// Indicates whether the tab is currently active.
  final bool active;

  /// The icon to display.
  final Widget? icon;

  /// The icon to display when the tab is active.
  final Widget? activeIcon;

  /// The icon to display when the tab is inactive.
  final Widget? inactiveIcon;

  /// The color to use for the active state of the tab (icon and text).
  final Color? activeColor;

  /// The color to use for the inactive state of the tab (icon and text).
  final Color? inactiveColor;

  /// The text label of the tab. It's optional and only displayed if [showLabels] is true.
  final String? label;

  /// A flag to control whether to show the label under the icon.
  final bool showLabels;

  /// A flag to control whether to override the color of the icons.
  final bool overrideIconsColor;

  /// The text style to use for the label when the tab is active.
  final TextStyle? activeLabelTextStyle;

  /// The text style to use for the label when the tab is inactive.
  final TextStyle? inactiveLabelTextStyle;

  const TabInnerItem({
    super.key,
    required this.active,
    this.icon,
    required this.activeIcon,
    required this.inactiveIcon,
    required this.activeColor,
    required this.inactiveColor,
    this.label,
    this.showLabels = false,
    required this.overrideIconsColor,
    this.activeLabelTextStyle,
    this.inactiveLabelTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    Widget result = const SizedBox.shrink();
    if (showLabels && label != null) {
      // When showing labels, the icon and label are arranged in a column.
      result = LabelIconComponent(
        active: active,
        icon: icon,
        activeIcon: activeIcon,
        inactiveIcon: inactiveIcon,
        activeColor: activeColor,
        inactiveColor: inactiveColor,
        label: label!,
        overrideIconsColor: overrideIconsColor,
        activeLabelTextStyle: activeLabelTextStyle,
        inactiveLabelTextStyle: inactiveLabelTextStyle,
      );
    } else {
      // When not showing labels, only display the icon.
      result = Positioned(
        top: 16,
        child: IconComponent(
          active: active,
          icon: icon,
          activeIcon: activeIcon,
          inactiveIcon: inactiveIcon,
          activeColor: activeColor,
          inactiveColor: inactiveColor,
          overrideIconsColor: overrideIconsColor,
        ),
      );
    }
    return result;
  }
}
