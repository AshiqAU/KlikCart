import 'package:flutter/material.dart';
import 'package:wc_demo/src/ui_lib/bootstrap.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  final root = await bootstrap();
  runApp(root);
}


