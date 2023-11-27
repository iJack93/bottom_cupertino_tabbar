import 'package:flutter/material.dart';
import 'package:bottom_cupertino_tabbar/bottom_cupertino_tabbar.dart';

import '../pages/pages.dart';

class TabBarWithCenteredButton extends StatefulWidget {
  const TabBarWithCenteredButton({super.key});

  @override
  State<TabBarWithCenteredButton> createState() => _TabBarWithCenteredButtonState();
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (builder) => const BonusPage()));
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, color: Colors.white, size: 28,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      onTabPressed: (index, model, nestedNavigator) {
        if(index != 2) {
          if (index != model.currentTab) {
            model.changePage(index);
          } else {
            //force remain on index 0
            if (nestedNavigator[index]?.currentContext != null) {
              Navigator.of(nestedNavigator[index]!.currentContext!).popUntil((route) => route.isFirst);
            }
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
            empty: true,
          ),
          page: Container(),
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
