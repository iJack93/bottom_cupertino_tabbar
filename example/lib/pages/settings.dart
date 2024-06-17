import 'package:bottom_cupertino_tabbar_example/pages/secondary_pages/settings_details_page_one.dart';
import 'package:flutter/material.dart';

import '../example_manager/example_manager.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
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
                    builder: (builder) => const SettingsDetailsPageOne(),
                  ),
                );
              },
              child: const Text("Open details"),
            ),
            ElevatedButton(
              onPressed: () {
                final manager = ExampleManager().tabbarProviderModel;
                if (manager != null) {
                  manager.changePage(0);
                }
              },
              child: const Text("Go Back Home"),
            )
          ],
        ),
      ),
    );
  }
}
