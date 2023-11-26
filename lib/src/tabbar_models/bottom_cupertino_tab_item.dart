import 'package:flutter/material.dart';

class BottomCupertinoTab {
  final BottomCupertinoTabItem tab;
  final Widget page;

  BottomCupertinoTab({
    required this.tab,
    required this.page
  });

}

class BottomCupertinoTabItem {

  final String? activeIcon;
  final String? inactiveIcon;
  final String? label;
  final int notificationsCounter;
  final bool showNotifications;
  final bool empty;

  const BottomCupertinoTabItem({
    this.activeIcon,
    this.inactiveIcon,
    this.label,
    this.notificationsCounter = 0,
    this.showNotifications = false,
    this.empty = false,
  });

}