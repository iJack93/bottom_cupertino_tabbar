import 'package:flutter/material.dart';
import 'package:bottom_cupertino_tabbar/bottom_cupertino_tabbar.dart';

import '../pages/pages.dart';

class SimpleTabBar extends StatefulWidget {
  const SimpleTabBar({super.key});

  @override
  State<SimpleTabBar> createState() => _SimpleTabBarState();
}

class _SimpleTabBarState extends State<SimpleTabBar> {
  @override
  Widget build(BuildContext context) {
    return BottomCupertinoTabbar(
      activeColor: Colors.blue,
      inactiveColor: Colors.grey[300]!,
      notificationsBadgeColor: Colors.red,
      firstActiveIndex: 0,
      resizeToAvoidBottomInset: false,
      showLabels: true,
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
      children: [
        BottomCupertinoTab(
          tab: const BottomCupertinoTabItem(
            activeIcon: "assets/bottom/home.svg",
            inactiveIcon: "assets/bottom/home.svg",
            label: "Home",
          ),
          page: const HomePage(),
        ),
        BottomCupertinoTab(
          tab: const BottomCupertinoTabItem(
            activeIcon: "assets/bottom/bell.svg",
            inactiveIcon: "assets/bottom/bell.svg",
            label: "Notifications",
          ),
          page: const NotificationsPage(),
        ),
        BottomCupertinoTab(
          tab: const BottomCupertinoTabItem(
            activeIcon: "assets/bottom/contacts.svg",
            inactiveIcon: "assets/bottom/contacts.svg",
            notificationsCounter: 4,
            showNotifications: true,
            label: "Contacts",
          ),
          page: const ContactsPage(),
        ),
        BottomCupertinoTab(
          tab: const BottomCupertinoTabItem(
            activeIcon: "assets/bottom/settings.svg",
            inactiveIcon: "assets/bottom/settings.svg",
            label: "Settings",
          ),
          page: const SettingsPage(),
        ),
      ],
    );
  }
}
