import 'package:flutter/material.dart';
import 'package:bottom_cupertino_tabbar/bottom_cupertino_tabbar.dart';

import '../pages/pages.dart';
import 'example_manager/example_manager.dart';

class SimpleTabBar extends StatefulWidget {
  const SimpleTabBar({super.key});

  @override
  State<SimpleTabBar> createState() => _SimpleTabBarState();
}

class _SimpleTabBarState extends State<SimpleTabBar> {
  @override
  Widget build(BuildContext context) {
    return BottomCupertinoTabbar(
      notificationsBadgeColor: Colors.red,
      firstActiveIndex: 0,
      resizeToAvoidBottomInset: false,
      showLabels: true,
      overrideIconsColor: false,
      tabbarModel: (model, nestedNavigator) {
        ExampleManager().tabbarProviderModel = model;
        ExampleManager().nestedNavigator = nestedNavigator;
      },
      onTabPressed: (index, model, nestedNavigator) {
        if (index != model.currentTab) {
          model.changePage(index);
        } else {
          if (nestedNavigator[index]?.currentContext != null) {
            Navigator.of(nestedNavigator[index]!.currentContext!)
                .popUntil((route) => route.isFirst);
          }
        }
      },
      children: const [
        BottomCupertinoTab(
          tab: BottomCupertinoTabItem(
            activeIcon: Icon(
              Icons.home,
              size: 22,
              color: Colors.blue,
            ),
            inactiveIcon: Icon(
              Icons.home_outlined,
              size: 22,
              color: Colors.grey,
            ),
            label: "Home",
            activeLabelTextStyle: TextStyle(color: Colors.blue),
            inactiveLabelTextStyle: TextStyle(color: Colors.grey),
          ),
          page: HomePage(),
        ),
        BottomCupertinoTab(
          tab: BottomCupertinoTabItem(
            activeIcon: Icon(
              Icons.notifications,
              size: 22,
              color: Colors.blue,
            ),
            inactiveIcon: Icon(
              Icons.notifications_outlined,
              size: 22,
              color: Colors.grey,
            ),
            label: "Notifications",
            activeLabelTextStyle: TextStyle(color: Colors.blue),
            inactiveLabelTextStyle: TextStyle(color: Colors.grey),
          ),
          page: NotificationsPage(),
        ),
        BottomCupertinoTab(
          tab: BottomCupertinoTabItem(
            activeIcon: Icon(
              Icons.contacts,
              size: 22,
              color: Colors.blue,
            ),
            inactiveIcon: Icon(
              Icons.contacts_outlined,
              size: 22,
              color: Colors.grey,
            ),
            notificationsCounter: 4,
            showNotifications: true,
            label: "Contacts",
            activeLabelTextStyle: TextStyle(color: Colors.blue),
            inactiveLabelTextStyle: TextStyle(color: Colors.grey),
          ),
          page: ContactsPage(),
        ),
        BottomCupertinoTab(
          tab: BottomCupertinoTabItem(
            activeIcon: Icon(
              Icons.settings,
              size: 22,
              color: Colors.blue,
            ),
            inactiveIcon: Icon(
              Icons.settings_outlined,
              size: 22,
              color: Colors.grey,
            ),
            label: "Settings",
            activeLabelTextStyle: TextStyle(color: Colors.blue),
            inactiveLabelTextStyle: TextStyle(color: Colors.grey),
          ),
          page: SettingsPage(),
        ),
      ],
    );
  }
}
