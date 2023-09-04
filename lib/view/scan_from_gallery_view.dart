import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrcode_scanner/view%20model/scan_from_gallery_viewmodel.dart';
import 'package:qrcode_scanner/widgets/my_drawer.dart';

import 'about_view.dart';

class ScanFromGalleryView extends StatelessWidget {
  static const path = "scan_from_gallery";
  const ScanFromGalleryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/bg.jpg"), fit: BoxFit.fill)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () =>
                        Navigator.of(context).pushNamed(AboutView.path),
                    icon: const Icon(Icons.info_outline_rounded))
              ],
              title: const Text("Qr Code Scanner"),
              backgroundColor: Colors.transparent,
              elevation: 0.1),
          body: const Center(
              child: Text(
            "Import your file here!",
            style: TextStyle(fontSize: 24, color: Colors.black87),
          )),
          floatingActionButton: SizedBox(
              height: 70,
              width: 70,
              child: Consumer<ScanFromGalleryViewModel>(
                builder: (context, value, child) => FloatingActionButton(
                    onPressed: () => value.scanFromGallery(context),
                    child: const Icon(Icons.qr_code_2_outlined)),
              )),
          drawer: const MyDrawer()),
    );
  }
}
