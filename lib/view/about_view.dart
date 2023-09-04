import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view model/about_viewmodel.dart';

class AboutView extends StatelessWidget {
  static const path = "about";
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    AboutViewModel aboutViewModel =
        Provider.of<AboutViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: const Text("About"), centerTitle: true),
      body: ListView(
        children: [
          const Card(
              child: ListTile(
            title: Text("App Version"),
            trailing:
                Text("1.0.1", style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text("Application current version"),
            ),
          )),
          Card(
              child: ListTile(
            title: const Text("Faceboo Page"),
            onTap: () => aboutViewModel.fbpage(),
            trailing: const Icon(Icons.facebook_outlined),
            subtitle: const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text("Follow us on facebook"),
            ),
          )),
          Card(
              child: ListTile(
            title: const Text("Contact us"),
            onTap: () => aboutViewModel.contactUs(),
            trailing: const Icon(Icons.email_outlined),
            subtitle: const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text("Contact us on Email"),
            ),
          )),
        ],
      ),
    );
  }
}
