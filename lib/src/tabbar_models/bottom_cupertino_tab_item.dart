import 'package:flutter/material.dart';

/// BottomCupertinoTab represents a single tab in a bottom navigation bar.
/// It contains the tab's configuration and the associated page widget.
class BottomCupertinoTab {
  /// Configuration for the tab's appearance and behavior.
  final BottomCupertinoTabItem tab;

  /// The widget (usually a page) that is associated with the tab.
  final Widget page;

  /// Constructs a BottomCupertinoTab with a given tab configuration and associated page.
  ///
  /// [tab]: Configuration for the tab's design and behavior.
  /// [page]: The widget to display when this tab is selected.
  const BottomCupertinoTab({required this.tab, required this.page});
}

/// BottomCupertinoTabItem holds the configuration for a tab in the BottomCupertinoTabbar.
class BottomCupertinoTabItem {
  /// The single icon to display.
  final Widget? icon;

  /// The icon when the tab is active.
  final Widget? activeIcon;

  /// The icon when the tab is inactive.
  final Widget? inactiveIcon;

  /// The text label for the tab.
  final String? label;

  /// The number of notifications to be displayed on the tab.
  final int notificationsCounter;

  /// Controls whether to show the notifications counter.
  final bool showNotifications;

  /// Indicates if the tab is to be considered as an empty placeholder.
  final bool empty;

  /// The text style to use for the label when the tab is active.
  final TextStyle? activeLabelTextStyle;

  /// The text style to use for the label when the tab is inactive.
  final TextStyle? inactiveLabelTextStyle;

  const BottomCupertinoTabItem({
    this.icon,
    this.activeIcon,
    this.inactiveIcon,
    this.label,
    this.notificationsCounter = 0,
    this.showNotifications = false,
    this.empty = false,
    this.activeLabelTextStyle,
    this.inactiveLabelTextStyle,
  });
}
