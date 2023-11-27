import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:bottom_cupertino_tabbar/bottom_cupertino_tabbar.dart';

import 'pages_test/contacts.dart';
import 'pages_test/home.dart';
import 'pages_test/notifications.dart';
import 'pages_test/settings.dart';

class BottomCupertinoTabbarTest extends StatelessWidget {
  const BottomCupertinoTabbarTest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: BottomCupertinoTabbar(
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
              //force remain on index 0
              if (nestedNavigator[index]?.currentContext != null) {
                Navigator.of(nestedNavigator[index]!.currentContext!).popUntil((route) => route.isFirst);
              }
            }
          },
          children: [
            BottomCupertinoTab(
              tab: const BottomCupertinoTabItem(
                activeIcon: "test/assets/bottom/home.svg",
                inactiveIcon: "test/assets/bottom/home.svg",
                label: "Home",
              ),
              page: const HomePage(),
            ),
            BottomCupertinoTab(
              tab: const BottomCupertinoTabItem(
                activeIcon: "test/assets/bottom/bell.svg",
                inactiveIcon: "test/assets/bottom/bell.svg",
                label: "Notifications",
              ),
              page: const NotificationsPage(),
            ),
            BottomCupertinoTab(
              tab: const BottomCupertinoTabItem(
                activeIcon: "test/assets/bottom/contacts.svg",
                inactiveIcon: "test/assets/bottom/contacts.svg",
                notificationsCounter: 4,
                showNotifications: true,
                label: "Contacts",
              ),
              page: const ContactsPage(),
            ),
            BottomCupertinoTab(
              tab: const BottomCupertinoTabItem(
                activeIcon: "test/assets/bottom/settings.svg",
                inactiveIcon: "test/assets/bottom/settings.svg",
                label: "Settings",
              ),
              page: const SettingsPage(),
            ),
          ],
        ),
      ),
    );
  }
}


void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Bottom cupertino tabbar test', (WidgetTester tester) async {
    /// build the widget frame
    await tester.pumpWidget(const BottomCupertinoTabbarTest());
    expect(find.byType(BottomCupertinoTabbar), findsOneWidget);
    expect(find.byType(HomePage), findsOneWidget);
    expect(find.byType(NotificationsPage), findsNothing);
    expect(find.byType(ContactsPage), findsNothing);
    expect(find.byType(SettingsPage), findsNothing);
    expect(find.byType(TabItem), findsNWidgets(4));
    await tester.pump();
  });
}
