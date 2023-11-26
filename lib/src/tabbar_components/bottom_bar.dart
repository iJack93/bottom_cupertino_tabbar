import 'dart:io';
import 'package:bottom_cupertino_tabbar/src/tabbar_components/tab_item.dart';
import 'package:flutter/material.dart';

import '../tabbar_models/bottom_cupertino_tab_item.dart';
import '../tabbar_models/bottom_cupertino_tabbar_provider_model.dart';
import '../tabbar_components/custom_cupertino_tabbar.dart' as custom_cupertino_tabbar;

class BottomBar extends StatefulWidget {
  final Map<int, GlobalKey<NavigatorState>> nestedNavigator;
  final BottomCupertinoTabbarProviderModel model;
  final Color activeColor;
  final Color inactiveColor;
  final Color notificationsBadgeColor;
  final int firstActiveIndex;
  final List<BottomCupertinoTab> tabs;
  final Function(int, BottomCupertinoTabbarProviderModel, Map<int, GlobalKey<NavigatorState>>) onTabPressed;
  final bool showLabels;

  const BottomBar({
    super.key,
    required this.nestedNavigator,
    required this.model,
    required this.activeColor,
    required this.inactiveColor,
    required this.notificationsBadgeColor,
    required this.firstActiveIndex,
    required this.tabs,
    required this.onTabPressed,
    this.showLabels = false,
  });

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final double _kTabBarHeight = 50.0;
  List<BottomNavigationBarItem> _tabs = [];

  List<BottomNavigationBarItem> _getTabs(List<BottomCupertinoTab> tabs) {
    List<BottomNavigationBarItem> results = [];
    for(int i = 0; i < tabs.length; i++) {
      final bottomCupertinoTab = tabs[i];
      if(!bottomCupertinoTab.tab.empty) {
        bool isActive = widget.model.currentTab == i;
        final tab = TabItem(
          activeIcon: bottomCupertinoTab.tab.activeIcon!,
          inactiveIcon: bottomCupertinoTab.tab.inactiveIcon!,
          label: bottomCupertinoTab.tab.label,
          showNotifications: bottomCupertinoTab.tab.showNotifications,
          notificationsCounter: bottomCupertinoTab.tab.notificationsCounter,
          activeColor: widget.activeColor,
          inactiveColor: widget.inactiveColor,
          notificationsBadgeColor: widget.notificationsBadgeColor,
          active: isActive,
          isFirstActiveIndex: widget.firstActiveIndex == i,
          showLabels: widget.showLabels,
        );
        results.add(BottomNavigationBarItem(icon: tab));
      } else {
        results.add(BottomNavigationBarItem(icon: Container()));
      }
    }
    return results;
  }

  bool _isKeyboardOpen(BuildContext context) {
    return MediaQuery.viewInsetsOf(context).bottom > 0;
  }

  double _getToolbarHeight(BuildContext context) {
    double result = 0;
    double height = Platform.isAndroid ? _kTabBarHeight + 8 : _kTabBarHeight;
    final bool isKeyboardOpened = _isKeyboardOpen(context);
    if(isKeyboardOpened) {
      height = 0;
    }
    result = height;
    return result;
  }

  @override
  Widget build(BuildContext context) {
    _tabs = _getTabs(widget.tabs);
    return custom_cupertino_tabbar.CupertinoTabBar(
      backgroundColor: Colors.white,
      duration: const Duration(milliseconds: 125),
      border: null,
      iconSize: 30,
      height: _getToolbarHeight(context),
      currentIndex: widget.model.currentTab,
      onTap: (int index) {
        widget.onTabPressed(index, widget.model, widget.nestedNavigator);
      },
      items: _tabs,
    );
  }
}
