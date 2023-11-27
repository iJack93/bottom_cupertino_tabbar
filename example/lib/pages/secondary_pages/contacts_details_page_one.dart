import 'package:flutter/material.dart';

class ContactsDetailsPageOne extends StatelessWidget {
  const ContactsDetailsPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts Details 1"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Welcome to contacts page details"),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Back to Contacts"),
            )
          ],
        ),
      ),
    );
  }
}
