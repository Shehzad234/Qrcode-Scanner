import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qrcode_scanner/utils/show_message.dart';
import 'package:share_plus/share_plus.dart';

class AfterScanViewMode extends ChangeNotifier {
  copyToClipborder(String text, BuildContext context) {
    Clipboard.setData(ClipboardData(text: text));
    showMessage(
        message: "Sucssfully Copied", context: context, color: Colors.green);
  }

  shareText(String text) => Share.share(text);

  backPress(BuildContext context) => Navigator.of(context).pop();
}
