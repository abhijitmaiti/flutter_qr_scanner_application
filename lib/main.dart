import 'package:flutter/material.dart';
import 'package:qr_code/screen/QRScannerScreen.dart';
import 'package:qr_code/Theme/theme.dart';
import 'splace screen/splaceScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      home: SplaceScreen(),
    );
  }
}


