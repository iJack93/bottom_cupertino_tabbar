import 'package:flutter/material.dart';

class SettingsDetailsPageOne extends StatelessWidget {
  const SettingsDetailsPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings Details 1"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Welcome to settings page details"),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Back to Settings")
            )
          ],
        ),
      ),
    );
  }
}
