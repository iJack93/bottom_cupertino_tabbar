import 'package:flutter/material.dart';

class IconComponent extends StatelessWidget {
  /// Indicates whether the icon is in the active state.
  final bool active;

  /// The icon to display.
  final Widget? icon;

  /// The icon to display when the component is active.
  final Widget? activeIcon;

  /// The icon to display when the component is inactive.
  final Widget? inactiveIcon;

  /// The color to use for the icon when the component is active.
  final Color? activeColor;

  /// The color to use for the icon when the component is inactive.
  final Color? inactiveColor;

  /// A flag to control whether to override the color of the icons.
  final bool overrideIconsColor;

  /// Creates an [IconComponent] widget.
  ///
  /// An assertion ensures that either [icon] with [overrideIconsColor] set to true and both [activeColor] and [inactiveColor] are provided,
  /// or both [activeIcon] and [inactiveIcon] are provided.
  const IconComponent({
    super.key,
    required this.active,
    this.icon,
    this.activeIcon,
    this.inactiveIcon,
    required this.activeColor,
    required this.inactiveColor,
    required this.overrideIconsColor,
  }) : assert(
          (icon != null &&
                  overrideIconsColor == true &&
                  activeColor != null &&
                  inactiveColor != null) ||
              (activeIcon != null && inactiveIcon != null),
          'Provide either icon with overrideIconColor set to true, or both activeIcon and inactiveIcon.',
        );

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (activeIcon != null && inactiveIcon != null) {
      child = active ? activeIcon! : inactiveIcon!;
    } else if (icon != null) {
      child = icon!;
    } else {
      return const SizedBox.shrink();
    }

    if (overrideIconsColor && activeColor != null && inactiveColor != null) {
      final Color tintColor = active ? activeColor! : inactiveColor!;

      return SizedBox(
        height: 22,
        width: 22,
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(
            tintColor,
            BlendMode.srcIn,
          ),
          child: child,
        ),
      );
    } else {
      // No color override; return the original icon
      return SizedBox(
        height: 22,
        width: 22,
        child: child,
      );
    }
  }
}
