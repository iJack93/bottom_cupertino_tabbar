import 'package:bottom_cupertino_tabbar_example/example_manager/example_manager.dart';
import 'package:flutter/material.dart';
import 'package:bottom_cupertino_tabbar/bottom_cupertino_tabbar.dart';
import 'package:flutter_svg/svg.dart';

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
      notificationsBadgeColor: Colors.red,
      firstActiveIndex: 0,
      resizeToAvoidBottomInset: false,
      showLabels: true,
      tabbarModel: (model, nestedNavigator) {
        ExampleManager().tabbarProviderModel = model;
        ExampleManager().nestedNavigator = nestedNavigator;
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
        BottomCupertinoTab(
          tab: BottomCupertinoTabItem(
            activeIcon: SvgPicture.asset(
              "assets/bottom/home.svg",
              height: 22,
              colorFilter: const ColorFilter.mode(
                Colors.blue,
                BlendMode.srcIn,
              ),
            ),
            inactiveIcon: SvgPicture.asset(
              "assets/bottom/home.svg",
              height: 22,
              colorFilter: const ColorFilter.mode(
                Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            label: "Home",
            activeLabelTextStyle: const TextStyle(color: Colors.blue),
            inactiveLabelTextStyle: const TextStyle(color: Colors.grey),
          ),
          page: const HomePage(),
        ),
        BottomCupertinoTab(
          tab: BottomCupertinoTabItem(
            activeIcon: SvgPicture.asset(
              "assets/bottom/bell.svg",
              height: 22,
              colorFilter: const ColorFilter.mode(
                Colors.blue,
                BlendMode.srcIn,
              ),
            ),
            inactiveIcon: SvgPicture.asset(
              "assets/bottom/bell.svg",
              height: 22,
              colorFilter: const ColorFilter.mode(
                Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            label: "Notifications",
            activeLabelTextStyle: const TextStyle(color: Colors.blue),
            inactiveLabelTextStyle: const TextStyle(color: Colors.grey),
          ),
          page: const NotificationsPage(),
        ),
        const BottomCupertinoTab(
          tab: BottomCupertinoTabItem(
            empty: true,
          ),
          page: SizedBox.shrink(),
        ),
        BottomCupertinoTab(
          tab: BottomCupertinoTabItem(
            activeIcon: SvgPicture.asset(
              "assets/bottom/contacts.svg",
              height: 22,
              colorFilter: const ColorFilter.mode(
                Colors.blue,
                BlendMode.srcIn,
              ),
            ),
            inactiveIcon: SvgPicture.asset(
              "assets/bottom/contacts.svg",
              height: 22,
              colorFilter: const ColorFilter.mode(
                Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            notificationsCounter: 4,
            showNotifications: true,
            label: "Contacts",
            activeLabelTextStyle: const TextStyle(color: Colors.blue),
            inactiveLabelTextStyle: const TextStyle(color: Colors.grey),
          ),
          page: const ContactsPage(),
        ),
        BottomCupertinoTab(
          tab: BottomCupertinoTabItem(
            activeIcon: SvgPicture.asset(
              "assets/bottom/settings.svg",
              height: 22,
              colorFilter: const ColorFilter.mode(
                Colors.blue,
                BlendMode.srcIn,
              ),
            ),
            inactiveIcon: SvgPicture.asset(
              "assets/bottom/settings.svg",
              height: 22,
              colorFilter: const ColorFilter.mode(
                Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            label: "Settings",
            activeLabelTextStyle: const TextStyle(color: Colors.blue),
            inactiveLabelTextStyle: const TextStyle(color: Colors.grey),
          ),
          page: SettingsPage(),
        ),
      ],
    );
  }
}
