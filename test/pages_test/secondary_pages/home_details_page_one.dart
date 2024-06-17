import 'package:flutter/material.dart';

class HomeDetailsPageOne extends StatelessWidget {
  const HomeDetailsPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Details 1"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Welcome to home page details"),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Back to Home"))
          ],
        ),
      ),
    );
  }
}
