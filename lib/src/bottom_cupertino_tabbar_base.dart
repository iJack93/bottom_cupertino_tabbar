import 'dart:async';

import 'package:bottom_cupertino_tabbar/src/tabbar_components/bottom_bar.dart';
import 'package:bottom_cupertino_tabbar/src/tabbar_components/item_child.dart';
import 'package:bottom_cupertino_tabbar/src/tabbar_models/bottom_cupertino_tab_item.dart';
import 'package:bottom_cupertino_tabbar/src/tabbar_models/bottom_cupertino_tabbar_provider_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomCupertinoTabbar extends StatefulWidget {

  final Color activeColor;
  final Color inactiveColor;
  final Color notificationsBadgeColor;
  final int firstActiveIndex;
  final List<BottomCupertinoTab> children;
  final Function(int, BottomCupertinoTabbarProviderModel, Map<int, GlobalKey<NavigatorState>>) onTabPressed;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final bool? resizeToAvoidBottomInset;
  final Color backgroundColor;
  final bool showLabels;

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
  });

  @override
  State<BottomCupertinoTabbar> createState() => _BottomCupertinoTabbarState();
}

class _BottomCupertinoTabbarState extends State<BottomCupertinoTabbar> {

  Map<int, GlobalKey<NavigatorState>> _nestedNavigator = {};
  final BottomCupertinoTabbarProviderModel _homeVM = BottomCupertinoTabbarProviderModel();

  @override
  void initState() {
    super.initState();
    final tabs = widget.children.where((tab) => tab.tab.empty == false);
    _nestedNavigator = _createNestedNavigator(tabs.length);
  }

  Map<int, GlobalKey<NavigatorState>> _createNestedNavigator(int items) {
    Map<int, GlobalKey<NavigatorState>> localNestedNavigator = {};
    for(int i = 0; i < items; i++) {
      localNestedNavigator.addAll({
        i: GlobalKey<NavigatorState>(),
      });
    }
    return localNestedNavigator;
  }

  Future<bool> _onPopInvoked(int currentTab) async {
    final isFirstRouteInCurrentTab = !await _nestedNavigator[currentTab]!.currentState!.maybePop();
    return isFirstRouteInCurrentTab;
  }

  List<Widget> _getChildren(
    List<BottomCupertinoTab> pages,
    Map<int, GlobalKey<NavigatorState>> nestedNavigator
  ) {
    List<Widget> results = [];
    for(int i = 0; i < pages.length; i++) {
      var child = pages[i];
      var indexedWidget = ItemChild(
        navigatorKey: nestedNavigator[i],
        child: child.page
      );
      results.add(indexedWidget);
    }
    return results;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _homeVM,
      child: Consumer<BottomCupertinoTabbarProviderModel>(
        builder: (context, model, child) {
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
              ),
              body: IndexedStack(
                index: currentTab,
                children: _getChildren(widget.children, _nestedNavigator),
              ),
            ),
          );
        },
      ),
    );
  }
}