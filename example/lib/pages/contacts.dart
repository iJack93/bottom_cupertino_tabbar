import 'package:bottom_cupertino_tabbar_example/pages/secondary_pages/contacts_details_page_one.dart';
import 'package:flutter/material.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Welcome to contacts page"),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (builder) => const ContactsDetailsPageOne()));
              },
              child: const Text("Open details")
            )
          ],
        ),
      )
    );
  }
}