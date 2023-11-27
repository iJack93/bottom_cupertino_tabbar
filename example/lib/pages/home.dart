import 'package:bottom_cupertino_tabbar_example/pages/secondary_pages/home_details_page_one.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Welcome to home page"),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (builder) => const HomeDetailsPageOne(),
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
