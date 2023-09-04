import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qrcode_scanner/view%20model/scan_from_gallery_viewmodel.dart';
import 'package:qrcode_scanner/view/after_scan.dart';
import 'package:qrcode_scanner/widgets/my_drawer.dart';

import 'about_view.dart';

class ScanFromCamera extends StatefulWidget {
  const ScanFromCamera({super.key});
  static const path = "scan_from_cammera";
  @override
  State<ScanFromCamera> createState() => _ScanFromCameraState();
}

class _ScanFromCameraState extends State<ScanFromCamera> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  Barcode? result;
  QRViewController? controller;
  String? text;
  bool flashFlag = false;
  bool cameraStatus = true;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScanFromGalleryViewModel scanFromGalleryViewModel =
        Provider.of<ScanFromGalleryViewModel>(context);
    void onQRViewCreated(QRViewController controller) {
      this.controller = controller;
      controller.scannedDataStream.listen((scanData) async {
        log(scanData.code.runtimeType.toString());

        result = scanData;
        scanFromGalleryViewModel.scanFromCamera(result?.code ?? "");
        log(result?.code.toString() ?? "no");

        await Navigator.of(context).popAndPushNamed(AfterScan.afterscan);
      });
    }

    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg.jpg"), fit: BoxFit.fill)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.1,
            title: const Text("Qr Code Scanner"),
            actions: [
              StatefulBuilder(
                  builder: (context, setState) => IconButton(
                      onPressed: () {
                        controller!.toggleFlash();
                        flashFlag = !flashFlag;
                        setState(() {});
                      },
                      icon: flashFlag
                          ? const Icon(Icons.flash_on_rounded)
                          : const Icon(Icons.flash_off_outlined))),
              IconButton(
                  onPressed: () =>
                      Navigator.of(context).pushNamed(AboutView.path),
                  icon: const Icon(Icons.info_outline_rounded))
            ],
          ),
          body: cameraStatus
              ? Column(children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: QRView(
                      overlay: QrScannerOverlayShape(
                          borderWidth: 2, cutOutSize: 300),
                      key: qrKey,
                      onQRViewCreated: onQRViewCreated,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: (result != null)
                          ? Text(
                              'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
                          : const Text('Scanning...',
                              style: TextStyle(fontSize: 24)),
                    ),
                  )
                ])
              : const Center(child: Text("Start Scanning")),
          floatingActionButton: FloatingActionButton(
              onPressed: () async {
                cameraStatus = !cameraStatus;
                result = null;
                setState(() {});
              },
              child: Icon(cameraStatus
                  ? Icons.stop_circle_outlined
                  : Icons.camera_alt_rounded)),
          drawer: const MyDrawer(),
        ));
  }
}
