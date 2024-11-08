import 'package:bottom_cupertino_tabbar/src/tabbar_components/tab_inner_item.dart';
import 'package:flutter/material.dart';

import 'notifications_badge.dart';

/// TabItem is a StatelessWidget used for rendering a single tab in a tab bar.
/// It supports active/inactive states, labels, notification badges, and custom coloring.
class TabItem extends StatelessWidget {
  /// The icon to display.
  final Widget? icon;

  /// The icon when the tab is active.
  final Widget? activeIcon;

  /// The icon when the tab is inactive.
  final Widget? inactiveIcon;

  /// The label text of the tab. It's optional and only displayed if [showLabels] is true.
  final String? label;

  /// Indicates whether the tab is currently active.
  final bool active;

  /// The counter for notifications. It is displayed in a badge if greater than 0.
  final int notificationsCounter;

  /// Indicates if this is the first tab to be active by default.
  final bool isFirstActiveIndex;

  /// The color to use for the active state of the tab (icon and text).
  final Color? activeColor;

  /// The color to use for the inactive state of the tab (icon and text).
  final Color? inactiveColor;

  /// The color of the notifications badge.
  final Color notificationsBadgeColor;

  /// A flag to control whether to show notifications badge.
  final bool showNotifications;

  /// A flag to control whether to show the label under the icon.
  final bool showLabels;

  /// A flag to control whether to override the color of the icons.
  final bool overrideIconsColor;

  /// The text style to use for the label when the tab is active.
  final TextStyle? activeLabelTextStyle;

  /// The text style to use for the label when the tab is inactive.
  final TextStyle? inactiveLabelTextStyle;

  /// Constructor for TabItem.
  const TabItem({
    super.key,
    this.icon,
    required this.activeIcon,
    required this.inactiveIcon,
    required this.label,
    this.active = false,
    this.notificationsCounter = 0,
    this.isFirstActiveIndex = false,
    required this.activeColor,
    required this.inactiveColor,
    required this.notificationsBadgeColor,
    this.showNotifications = false,
    this.showLabels = false,
    required this.overrideIconsColor,
    this.activeLabelTextStyle,
    this.inactiveLabelTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        TabInnerItem(
          active: active,
          icon: icon,
          activeIcon: activeIcon,
          inactiveIcon: inactiveIcon,
          activeColor: activeColor,
          inactiveColor: inactiveColor,
          label: label,
          showLabels: showLabels,
          overrideIconsColor: overrideIconsColor,
          activeLabelTextStyle: activeLabelTextStyle,
          inactiveLabelTextStyle: inactiveLabelTextStyle,
        ),
        NotificationsBadge(
          showNotifications: showNotifications,
          notificationsCounter: notificationsCounter,
          showLabels: showLabels,
          label: label,
          notificationsBadgeColor: notificationsBadgeColor,
        ),
      ],
    );
  }
}
