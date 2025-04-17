import 'package:bottom_cupertino_tabbar/bottom_cupertino_tabbar.dart';
import 'package:flutter/material.dart';

class ExampleManager {
  //singleton variables
  ExampleManager._();
  static final ExampleManager shared = ExampleManager._();

  //default singleton factory constructor
  factory ExampleManager() {
    return shared;
  }

  BottomCupertinoTabbarProviderModel? tabbarProviderModel;
  Map<int, GlobalKey<NavigatorState>>? nestedNavigator;
}
