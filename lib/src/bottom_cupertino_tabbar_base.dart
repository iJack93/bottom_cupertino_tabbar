import 'dart:async';

import 'package:bottom_cupertino_tabbar/src/tabbar_components/bottom_bar.dart';
import 'package:bottom_cupertino_tabbar/src/tabbar_components/item_child.dart';
import 'package:bottom_cupertino_tabbar/src/tabbar_models/bottom_cupertino_tab_item.dart';
import 'package:bottom_cupertino_tabbar/src/tabbar_models/bottom_cupertino_tabbar_provider_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// BottomCupertinoTabbar is a StatefulWidget for creating a customizable Cupertino-style bottom navigation bar.
/// It supports custom tab items, nested navigation, and optional floating action buttons.
class BottomCupertinoTabbar extends StatefulWidget {
  /// The color used for active tab items.
  final Color activeColor;

  /// The color used for inactive tab items.
  final Color inactiveColor;

  /// The color of notification badges on tab items.
  final Color notificationsBadgeColor;

  /// The index of the initially active tab.
  final int firstActiveIndex;

  /// The list of tabs to be displayed in the bottom navigation bar.
  final List<BottomCupertinoTab> children;

  /// Callback function invoked when a tab is pressed. Provides the index of the pressed tab,
  /// the state model, and a map of navigator keys for nested navigation.
  final Function(int, BottomCupertinoTabbarProviderModel,
      Map<int, GlobalKey<NavigatorState>>) onTabPressed;

  /// A function that returns a model to manage the state and behavior of the BottomCupertinoTabbar.
  final Function(BottomCupertinoTabbarProviderModel)? tabbarModel;

  /// An optional floating action button to be displayed alongside the tab bar.
  final Widget? floatingActionButton;

  /// The location of the floating action button within the scaffold.
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  /// Controls whether the bottom bar should resize when the on-screen keyboard appears.
  final bool? resizeToAvoidBottomInset;

  /// The background color of the bottom navigation bar.
  final Color backgroundColor;

  /// Flag to control whether labels are shown on the tab items.
  final bool showLabels;

  /// Constructs a BottomCupertinoTabbar.
  const BottomCupertinoTabbar({
    super.key,
    required this.activeColor,
    required this.inactiveColor,
    required this.notificationsBadgeColor,
    required this.firstActiveIndex,
    required this.children,
    required this.onTabPressed,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.resizeToAvoidBottomInset,
    this.backgroundColor = Colors.white,
    this.showLabels = false,
    this.tabbarModel,
  });

  @override
  State<BottomCupertinoTabbar> createState() => _BottomCupertinoTabbarState();
}

class _BottomCupertinoTabbarState extends State<BottomCupertinoTabbar> {
  /// A map to hold the keys for the nested navigators for each tab.
  Map<int, GlobalKey<NavigatorState>> _nestedNavigator = {};

  /// The model to manage the state and behavior of the BottomCupertinoTabbar.
  final BottomCupertinoTabbarProviderModel _homeVM =
      BottomCupertinoTabbarProviderModel();

  List<Widget>? _cachedChildren;

  @override
  void initState() {
    super.initState();
    // Filters tabs that are not empty and creates nested navigators for each.
    final tabs = widget.children.where((tab) => tab.tab.empty == false);
    _nestedNavigator = _createNestedNavigator(tabs.length);
  }

  /// Creates and initializes a map of GlobalKey<NavigatorState> for managing nested navigation.
  Map<int, GlobalKey<NavigatorState>> _createNestedNavigator(int items) {
    Map<int, GlobalKey<NavigatorState>> localNestedNavigator = {};
    for (int i = 0; i <= items; i++) {
      localNestedNavigator.addAll({
        i: GlobalKey<NavigatorState>(),
      });
    }
    return localNestedNavigator;
  }

  /// Handles the back navigation within each tab.
  /// Returns true if the navigator in the current tab is at its first route.
  Future<bool> _onPopInvoked(int currentTab) async {
    final isFirstRouteInCurrentTab =
        !await _nestedNavigator[currentTab]!.currentState!.maybePop();
    return isFirstRouteInCurrentTab;
  }

  /// Generates a list of ItemChild widgets for each tab, each wrapped in a Navigator.
  List<Widget> _getChildren(
      {required List<BottomCupertinoTab> pages,
      required Map<int, GlobalKey<NavigatorState>> nestedNavigator}) {
    if (_cachedChildren == null) {
      _cachedChildren = [];
      for (int i = 0; i < pages.length; i++) {
        var child = pages[i];
        var indexedWidget = ItemChild(
            key: ValueKey(i),
            navigatorKey: nestedNavigator[i],
            child: child.page);
        _cachedChildren!.add(indexedWidget);
      }
    }
    return _cachedChildren!;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _homeVM,
      child: Consumer<BottomCupertinoTabbarProviderModel>(
        builder: (context, model, child) {
          if (widget.tabbarModel != null) {
            widget.tabbarModel!(model);
          }
          var currentTab = model.currentTab;
          return NavigatorPopHandler(
            onPop: () async => await _onPopInvoked(currentTab),
            child: Scaffold(
              backgroundColor: widget.backgroundColor,
              resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
              floatingActionButton: widget.floatingActionButton,
              floatingActionButtonLocation: widget.floatingActionButtonLocation,
              bottomNavigationBar: BottomBar(
                model: model,
                nestedNavigator: _nestedNavigator,
                activeColor: widget.activeColor,
                inactiveColor: widget.inactiveColor,
                notificationsBadgeColor: widget.notificationsBadgeColor,
                firstActiveIndex: widget.firstActiveIndex,
                tabs: widget.children,
                onTabPressed: widget.onTabPressed,
                showLabels: widget.showLabels,
                backgroundColor: widget.backgroundColor,
              ),
              body: IndexedStack(
                index: currentTab,
                children: _getChildren(
                    pages: widget.children, nestedNavigator: _nestedNavigator),
              ),
            ),
          );
        },
      ),
    );
  }
}
