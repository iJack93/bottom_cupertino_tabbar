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
  BottomCupertinoTab({required this.tab, required this.page});
}

/// BottomCupertinoTabItem holds the configuration for a tab in the BottomCupertinoTabbar.
class BottomCupertinoTabItem {
  /// The path or identifier for the icon when the tab is active.
  final String? activeIcon;

  /// The path or identifier for the icon when the tab is inactive.
  final String? inactiveIcon;

  /// The text label for the tab.
  final String? label;

  /// The number of notifications to be displayed on the tab.
  final int notificationsCounter;

  /// Controls whether to show the notifications counter.
  final bool showNotifications;

  /// Indicates if the tab is to be considered as an empty placeholder.
  final bool empty;

  /// Constructs a BottomCupertinoTabItem with various customization options.
  ///
  /// [activeIcon]: Path for the active state icon.
  /// [inactiveIcon]: Path for the inactive state icon.
  /// [label]: Text label for the tab.
  /// [notificationsCounter]: Counter for notifications, displayed as a badge.
  /// [showNotifications]: Whether to show the notifications badge.
  /// [empty]: Whether the tab is an empty placeholder, useful for custom layouts.
  const BottomCupertinoTabItem({
    this.activeIcon,
    this.inactiveIcon,
    this.label,
    this.notificationsCounter = 0,
    this.showNotifications = false,
    this.empty = false,
  });
}
