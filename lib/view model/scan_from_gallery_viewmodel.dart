import 'package:flutter/material.dart';
import 'package:perfect_scanner/perfect_scanner.dart';
import 'package:qrcode_scanner/utils/show_message.dart';
import 'package:qrcode_scanner/view/after_scan.dart';

class ScanFromGalleryViewModel extends ChangeNotifier {
  String? imageData;
  Future<void> scanFromGallery(context) async {
    imageData = await ScannerController.getQrFromImage();
    if (imageData != "") {
      notifyListeners();
      Navigator.of(context).pushNamed(AfterScan.afterscan);
    } else {
      showMessage(
          message: "Something wents wrong",
          context: context,
          color: Colors.red);
    }
  }

  scanFromCamera(String? data) {
    imageData = data;
  }
}
