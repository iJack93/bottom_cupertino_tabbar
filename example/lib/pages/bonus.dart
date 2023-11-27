import 'package:flutter/material.dart';

class BonusPage extends StatelessWidget {
  const BonusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bonus"),
      ),
      body: const Center(
        child: Text("Welcome to the bonus page!"),
      ),
    );
  }
}
