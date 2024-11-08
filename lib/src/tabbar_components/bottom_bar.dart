import 'package:bottom_cupertino_tabbar/src/tabbar_components/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import '../tabbar_models/bottom_cupertino_tab_item.dart';
import '../tabbar_models/bottom_cupertino_tabbar_provider_model.dart';
import '../tabbar_components/custom_cupertino_tabbar.dart'
    as custom_cupertino_tabbar;

/// The BottomBar class is a StatefulWidget that builds a bottom navigation
/// bar using a collection of BottomCupertinoTab items. It is designed to integrate
/// with a navigation model and supports custom actions on tab selection.
class BottomBar extends StatefulWidget {
  /// A map of NavigatorState keys used for nested navigation in each tab.
  final Map<int, GlobalKey<NavigatorState>> nestedNavigator;

  /// The model that holds the current state of the BottomCupertinoTabbar.
  final BottomCupertinoTabbarProviderModel model;

  /// Color for active tab items.
  final Color? activeColor;

  /// Color for inactive tab items.
  final Color? inactiveColor;

  /// Color for notification badges on the tab items.
  final Color notificationsBadgeColor;

  /// The index of the initially active tab.
  final int firstActiveIndex;

  /// A list of tabs to display in the BottomCupertinoTabbar.
  final List<BottomCupertinoTab> tabs;

  /// Callback function invoked when a tab is pressed. Provides tab index,
  /// model state, and a map of nested navigators.
  final Function(int, BottomCupertinoTabbarProviderModel,
      Map<int, GlobalKey<NavigatorState>>) onTabPressed;

  /// Flag to show or hide labels under tab icons.
  final bool showLabels;

  /// Background color for the bottom navigation bar.
  final Color? backgroundColor;

  /// Flag to control whether to override the color of the icons.
  final bool overrideIconsColor;

  /// Constructor for BottomBar.
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
    this.backgroundColor,
    required this.overrideIconsColor,
  });

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  /// Default height for the tab bar.
  final double _kTabBarHeight = 50.0;

  /// Stores the BottomNavigationBar items converted from BottomCupertinoTab items.
  List<BottomNavigationBarItem> _tabs = [];

  /// Converts a list of BottomCupertinoTab items to BottomNavigationBarItems.
  /// This process includes setting up icons, labels, and notifications for each tab.
  List<BottomNavigationBarItem> _getTabs(List<BottomCupertinoTab> tabs) {
    List<BottomNavigationBarItem> results = [];
    for (int i = 0; i < tabs.length; i++) {
      final bottomCupertinoTab = tabs[i];
      if (!bottomCupertinoTab.tab.empty) {
        bool isActive = widget.model.currentTab == i;
        final tab = TabItem(
          icon: bottomCupertinoTab.tab.icon,
          activeIcon: bottomCupertinoTab.tab.activeIcon,
          inactiveIcon: bottomCupertinoTab.tab.inactiveIcon,
          label: bottomCupertinoTab.tab.label,
          showNotifications: bottomCupertinoTab.tab.showNotifications,
          notificationsCounter: bottomCupertinoTab.tab.notificationsCounter,
          activeColor: widget.activeColor,
          inactiveColor: widget.inactiveColor,
          notificationsBadgeColor: widget.notificationsBadgeColor,
          active: isActive,
          isFirstActiveIndex: widget.firstActiveIndex == i,
          showLabels: widget.showLabels,
          overrideIconsColor: widget.overrideIconsColor,
          activeLabelTextStyle: bottomCupertinoTab.tab.activeLabelTextStyle,
          inactiveLabelTextStyle: bottomCupertinoTab.tab.inactiveLabelTextStyle,
        );
        results.add(BottomNavigationBarItem(icon: tab));
      } else {
        results.add(BottomNavigationBarItem(icon: Container()));
      }
    }
    return results;
  }

  /// Checks if the on-screen keyboard is open in the current context.
  /// Returns true if the keyboard is open, otherwise false.
  bool _isKeyboardOpen(BuildContext context) {
    return MediaQuery.viewInsetsOf(context).bottom > 0;
  }

  /// Calculates the appropriate height of the toolbar.
  /// Adjusts height based on platform and keyboard visibility.
  double _getToolbarHeight(BuildContext context) {
    double result = 0;
    double height = !kIsWeb && defaultTargetPlatform == TargetPlatform.android
        ? _kTabBarHeight + 8
        : _kTabBarHeight;
    final bool isKeyboardOpened = _isKeyboardOpen(context);
    if (isKeyboardOpened) {
      height = 0;
    }
    result = height;
    return result;
  }

  @override
  Widget build(BuildContext context) {
    _tabs = _getTabs(widget.tabs);
    final bool isKeyboardOpened = _isKeyboardOpen(context);
    if (isKeyboardOpened) {
      return const SizedBox.shrink();
    }
    return custom_cupertino_tabbar.CupertinoTabBar(
      backgroundColor: widget.backgroundColor,
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
