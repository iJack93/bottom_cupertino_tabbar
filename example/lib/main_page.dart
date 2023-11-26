import 'package:bottom_cupertino_tabbar_example/simple_tabbar.dart';
import 'package:bottom_cupertino_tabbar_example/tabbar_with_centered_button.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bottom Cupertino TabBar Examples"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (builder) =>
                    const SimpleTabBar(),
                  ),
                );
              },
              child: const Text("Simple TabBar"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (builder) =>
                    const TabBarWithCenteredButton(),
                  ),
                );
              },
              child: const Text("TabBar with centered button"),
            ),
          ],
        ),
      ),
    );
  }
}
