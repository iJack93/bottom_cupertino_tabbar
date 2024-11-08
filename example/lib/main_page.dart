import 'package:bottom_cupertino_tabbar_example/simple_tabbar.dart';
import 'package:bottom_cupertino_tabbar_example/tabbar_with_centered_button.dart';
import 'package:flutter/material.dart';

import 'easy_tabbar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bottom Cupertino TabBar Examples"),
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Example with a simple icon widget and overriden colors inherited from tabbar",
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (builder) => const EasyTabbar(),
                    ),
                  );
                },
                child: const Text("Easy TabBar"),
              ),
              const SizedBox(height: 16),
              const Text(
                "Example with separate active and inactive icons widgets and label, each one with its own color and style",
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (builder) => const SimpleTabBar(),
                    ),
                  );
                },
                child: const Text("Simple TabBar"),
              ),
              const SizedBox(height: 16),
              const Text(
                "Example with separate active and inactive icons widgets, each one with its own color",
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (builder) => const TabBarWithCenteredButton(),
                    ),
                  );
                },
                child: const Text("TabBar with centered button"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
