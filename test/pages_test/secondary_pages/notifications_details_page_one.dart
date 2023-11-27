import 'package:flutter/material.dart';

class NotificationsDetailsPageOne extends StatelessWidget {
  const NotificationsDetailsPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications Details 1"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Welcome to notifications page details"),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Back to Notifications")
            )
          ],
        ),
      ),
    );
  }
}
