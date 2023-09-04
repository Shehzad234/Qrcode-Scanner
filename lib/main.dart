import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrcode_scanner/view%20model/about_viewmodel.dart';
import 'package:qrcode_scanner/view%20model/after_scan_viewmodel.dart';
import 'package:qrcode_scanner/view%20model/scan_from_gallery_viewmodel.dart';
import 'package:qrcode_scanner/view/intro_view.dart';

import 'utils/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ScanFromGalleryViewModel()),
        ChangeNotifierProvider(create: (context) => AfterScanViewMode()),
        ChangeNotifierProvider(create: (context) => AboutViewModel()),
      ],
      child: MaterialApp(
        title: 'Qr Code Scanner',
        routes: routes,
        theme: ThemeData(primarySwatch: Colors.blueGrey),
        home: const IntroView(),
      ),
    );
  }
}
