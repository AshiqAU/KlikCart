import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wc_demo/src/ui_lib/bootstrap.dart';

Future<void> main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  final root = await bootstrap();
  runApp(root);
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

