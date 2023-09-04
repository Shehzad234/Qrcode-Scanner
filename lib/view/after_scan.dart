import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrcode_scanner/utils/asset_urls.dart';
import 'package:qrcode_scanner/view%20model/after_scan_viewmodel.dart';
import 'package:qrcode_scanner/view%20model/scan_from_gallery_viewmodel.dart';
import 'package:qrcode_scanner/widgets/custom_button.dart';

class AfterScan extends StatelessWidget {
  static const afterscan = "after_scan";
  const AfterScan({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    String? data;
    String? imageData =
        Provider.of<ScanFromGalleryViewModel>(context).imageData;

    AfterScanViewMode afterScanViewMode =
        Provider.of<AfterScanViewMode>(context);
    if (imageData?.trim().startsWith("WIFI") ?? false) {
      data = imageData!.split(";")[2].split(":").last;
    } else {
      data = imageData;
    }
    TextEditingController controller =
        TextEditingController(text: data ?? "An Error Occur!");

    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg.jpg"), fit: BoxFit.fill)),
        child: Scaffold(
          backgroundColor: Colors.transparent.withOpacity(0.2),
          appBar: AppBar(
              title: const Text("Sucessfully Convertered"),
              centerTitle: true,
              backgroundColor: Colors.transparent),
          body: Container(
            margin: const EdgeInsets.only(bottom: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 10),
                    SizedBox(
                        height: screenSize.height * 0.25,
                        width: screenSize.width * 0.6,
                        child: Image.asset(AssetUrls.qrcode)),
                    const Divider(thickness: 2),
                    const SizedBox(height: 10),
                    const Text("Results",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            decoration: TextDecoration.underline)),
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: TextFormField(
                        maxLines: 5,
                        minLines: 5,
                        decoration: InputDecoration(
                            fillColor: Colors.white38,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                        controller: controller,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          customButton(
                              context: context,
                              icon: Icons.arrow_back_ios_new_outlined,
                              onPressed: () =>
                                  afterScanViewMode.backPress(context)),
                          customButton(
                              context: context,
                              icon: Icons.copy_all_outlined,
                              onPressed: () => afterScanViewMode
                                  .copyToClipborder(imageData ?? "", context)),
                          customButton(
                              context: context,
                              icon: Icons.share,
                              onPressed: () =>
                                  afterScanViewMode.shareText(imageData ?? "")),
                        ]),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
