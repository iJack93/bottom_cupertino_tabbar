import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:bottom_cupertino_tabbar/bottom_cupertino_tabbar.dart';

import 'pages_test/contacts.dart';
import 'pages_test/example_manager.dart';
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
          overrideIconsColor: true,
          height: 70,
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
                icon: Icon(
                  Icons.home,
                  size: 22,
                ),
                label: "Home",
              ),
              page: HomePage(),
            ),
            BottomCupertinoTab(
              tab: BottomCupertinoTabItem(
                icon: Icon(
                  Icons.notifications,
                  size: 22,
                ),
                label: "Notifications",
              ),
              page: NotificationsPage(),
            ),
            BottomCupertinoTab(
              tab: BottomCupertinoTabItem(
                icon: Icon(
                  Icons.contacts,
                  size: 22,
                ),
                notificationsCounter: 4,
                showNotifications: true,
                label: "Contacts",
              ),
              page: ContactsPage(),
            ),
            BottomCupertinoTab(
              tab: BottomCupertinoTabItem(
                icon: Icon(
                  Icons.settings,
                  size: 22,
                ),
                label: "Settings",
              ),
              page: SettingsPage(),
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
