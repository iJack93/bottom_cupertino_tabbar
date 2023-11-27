import 'package:flutter/cupertino.dart';

class BottomCupertinoTabbarProviderModel extends ChangeNotifier {
  /// Represents the current active tab.
  /// The default number given to _currentTab represents the first page opened at app start
  /// EXAMPLE: if _currentTab == 0 --> first page
  /// and so on
  int _currentTab = 0;

  /// Simple getter of current tab
  int get currentTab => _currentTab;

  /// Helper method that changes tab and notifies the new value
  void changePage(int index) {
    _currentTab = index;
    notifyListeners();
  }
}
