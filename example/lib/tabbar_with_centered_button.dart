import 'package:bottom_cupertino_tabbar_example/example_manager/example_manager.dart';
import 'package:flutter/material.dart';
import 'package:bottom_cupertino_tabbar/bottom_cupertino_tabbar.dart';

import '../pages/pages.dart';

class TabBarWithCenteredButton extends StatefulWidget {
  const TabBarWithCenteredButton({super.key});

  @override
  State<TabBarWithCenteredButton> createState() =>
      _TabBarWithCenteredButtonState();
}

class _TabBarWithCenteredButtonState extends State<TabBarWithCenteredButton> {
  @override
  Widget build(BuildContext context) {
    return BottomCupertinoTabbar(
      activeColor: Colors.blue,
      inactiveColor: Colors.grey[300]!,
      notificationsBadgeColor: Colors.red,
      firstActiveIndex: 0,
      resizeToAvoidBottomInset: false,
      showLabels: true,
      tabbarModel: (model) {
        ExampleManager().tabbarProviderModel = model;
      },
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (builder) => const BonusPage(),
            ),
          );
        },
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 28,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      onTabPressed: (index, model, nestedNavigator) {
        if (index != 2) {
          if (index != model.currentTab) {
            model.changePage(index);
          } else {
            //force remain on index 0
            if (nestedNavigator[index]?.currentContext != null) {
              Navigator.of(nestedNavigator[index]!.currentContext!)
                  .popUntil((route) => route.isFirst);
            }
          }
        }
      },
      children: [
        const BottomCupertinoTab(
          tab: BottomCupertinoTabItem(
            activeIcon: "assets/bottom/home.svg",
            inactiveIcon: "assets/bottom/home.svg",
            label: "Home",
          ),
          page: HomePage(),
        ),
        const BottomCupertinoTab(
          tab: BottomCupertinoTabItem(
            activeIcon: "assets/bottom/bell.svg",
            inactiveIcon: "assets/bottom/bell.svg",
            label: "Notifications",
          ),
          page: NotificationsPage(),
        ),
        BottomCupertinoTab(
          tab: const BottomCupertinoTabItem(
            empty: true,
          ),
          page: const SizedBox.shrink(),
        ),
        const BottomCupertinoTab(
          tab: BottomCupertinoTabItem(
            activeIcon: "assets/bottom/contacts.svg",
            inactiveIcon: "assets/bottom/contacts.svg",
            notificationsCounter: 4,
            showNotifications: true,
            label: "Contacts",
          ),
          page: ContactsPage(),
        ),
        const BottomCupertinoTab(
          tab: BottomCupertinoTabItem(
            activeIcon: "assets/bottom/settings.svg",
            inactiveIcon: "assets/bottom/settings.svg",
            label: "Settings",
          ),
          page: SettingsPage(),
        ),
      ],
    );
  }
}
