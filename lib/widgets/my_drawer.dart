import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrcode_scanner/utils/asset_urls.dart';

import '../view model/about_viewmodel.dart';
import '../view/about_view.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(children: [
      Container(
        margin: const EdgeInsets.all(5),
        height: 250,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
                image: AssetImage(AssetUrls.qrcode), fit: BoxFit.fill)),
      ),
      const Divider(
        thickness: 5,
      ),
      Card(
        child: ListTile(
          onTap: () => context.read<AboutViewModel>().contactUs(),
          title: const Text("Feedback"),
          trailing: const Icon(Icons.message_outlined),
        ),
      ),
      Card(
        child: ListTile(
          title: const Text("About"),
          onTap: () => Navigator.of(context).pushNamed(AboutView.path),
          trailing: const Icon(Icons.info_outline),
        ),
      ),
    ]));
  }
}
