import 'package:bottom_cupertino_tabbar_example/pages/secondary_pages/notifications_details_page_one.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Welcome to notifications page"),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (builder) => const NotificationsDetailsPageOne(),
                  ),
                );
              },
              child: const Text("Open details"),
            )
          ],
        ),
      ),
    );
  }
}
