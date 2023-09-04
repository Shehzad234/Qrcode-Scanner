import 'package:flutter/material.dart';
import 'package:qrcode_scanner/utils/asset_urls.dart';
import 'package:qrcode_scanner/view/scan_from_camera.dart';
import 'package:qrcode_scanner/view/scan_from_gallery_view.dart';
import 'package:qrcode_scanner/widgets/landingview_button.dart';

class LandingView extends StatelessWidget {
  static const path = "landing_view";
  const LandingView({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: screenSize.height * 0.12),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg.jpg"), fit: BoxFit.fill)),
        child: Column(
          children: [
            Container(
                width: 430,
                decoration: const BoxDecoration(color: Color(0xffd9d9d9))),
            Image.asset(
              "assets/qrcode.png",
              width: screenSize.width * 0.6,
              height: screenSize.height * 0.28,
            ),
            Container(
              width: 228,
              height: 39,
              decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xffded9d9), Color(0x00ded9d9)],
                  )),
              child: const Center(
                child: Text("QR CODE SCANNER",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    )),
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.22,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                landingViewButton(
                    context: context,
                    iconPath: AssetUrls.gallery,
                    title: "Scan From Gallery",
                    onTap: () => Navigator.of(context)
                        .pushNamed(ScanFromGalleryView.path)),
                landingViewButton(
                    context: context,
                    iconPath: AssetUrls.camera,
                    title: "Scan From Camera",
                    onTap: () =>
                        Navigator.of(context).pushNamed(ScanFromCamera.path)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
