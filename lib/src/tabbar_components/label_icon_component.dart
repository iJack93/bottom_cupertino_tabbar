import 'package:bottom_cupertino_tabbar/src/tabbar_components/label_component.dart';
import 'package:flutter/material.dart';

import 'icon_component.dart';

class LabelIconComponent extends StatelessWidget {
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
  final String label;

  /// A flag to control whether to override the color of the icons.
  final bool overrideIconsColor;

  /// The text style to use for the label when the tab is active.
  final TextStyle? activeLabelTextStyle;

  /// The text style to use for the label when the tab is inactive.
  final TextStyle? inactiveLabelTextStyle;

  /// Creates a [LabelIconComponent] widget.
  ///
  /// Assertions ensure that either both [activeLabelTextStyle] and [inactiveLabelTextStyle] are provided,
  /// or both [activeColor] and [inactiveColor] are provided, but not both.
  const LabelIconComponent({
    super.key,
    required this.active,
    this.icon,
    required this.activeIcon,
    required this.inactiveIcon,
    required this.activeColor,
    required this.inactiveColor,
    required this.label,
    required this.overrideIconsColor,
    this.activeLabelTextStyle,
    this.inactiveLabelTextStyle,
  })  : assert(
          (activeLabelTextStyle != null && inactiveLabelTextStyle != null) ||
              (activeColor != null && inactiveColor != null),
          'Either provide activeLabelTextStyle and inactiveLabelTextStyle, or activeColor and inactiveColor.',
        ),
        assert(
          (activeLabelTextStyle == null && inactiveLabelTextStyle == null) ||
              (activeColor == null && inactiveColor == null),
          'Cannot provide both label text styles and label colors. Choose one.',
        );

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
            icon: icon,
            activeIcon: activeIcon,
            inactiveIcon: inactiveIcon,
            activeColor: activeColor,
            inactiveColor: inactiveColor,
            overrideIconsColor: overrideIconsColor,
          ),
          // The label text positioned below the icon.
          LabelComponent(
            label: label,
            active: active,
            activeColor: activeColor,
            inactiveColor: inactiveColor,
            activeLabelTextStyle: activeLabelTextStyle,
            inactiveLabelTextStyle: inactiveLabelTextStyle,
          ),
        ],
      ),
    );
  }
}
