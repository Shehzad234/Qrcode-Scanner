import 'package:flutter/material.dart';
import 'package:qrcode_scanner/view/about_view.dart';
import 'package:qrcode_scanner/view/after_scan.dart';

import '../view/landing_view.dart';
import '../view/scan_from_camera.dart';
import '../view/scan_from_gallery_view.dart';

Map<String, Widget Function(BuildContext)> routes = {
  LandingView.path: (context) => const LandingView(),
  ScanFromGalleryView.path: (context) => const ScanFromGalleryView(),
  AfterScan.afterscan: (context) => const AfterScan(),
  ScanFromCamera.path: (context) => const ScanFromCamera(),
  AboutView.path: (context) => const AboutView(),
};
