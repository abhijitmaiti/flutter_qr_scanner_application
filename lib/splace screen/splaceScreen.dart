import 'dart:async';
import 'package:flutter/material.dart';
import 'package:qr_code/screen/QRScannerScreen.dart';

class SplaceScreen extends StatefulWidget {
  const SplaceScreen({super.key});

  @override
  State<SplaceScreen> createState() => _SplaceScreenState();
}

class _SplaceScreenState extends State<SplaceScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => const QRScanner())));
    final bool theme =
        MediaQuery.of(context).platformBrightness == Brightness.dark
            ? true
            : false;
    return theme
        ? Scaffold(
            backgroundColor: Colors.black,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 8,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.40,
                          width: MediaQuery.of(context).size.height * 0.40,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/qr_code_appliaction_splace_screen_image_dark_theme.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                  text: 'QR Capture',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          children: [
                            TextSpan(
                                text: 'Develop by jeetu\n\n',
                                style: TextStyle(
                                  letterSpacing: 2,
                                  color: Colors.white38,
                                )),
                            TextSpan(
                                text: "© Version 1.0.1.0",
                                style: TextStyle(
                                  color: Colors.white38,
                                  fontSize: 12,
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ))
        : Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 8,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.40,
                          width: MediaQuery.of(context).size.height * 0.40,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/qr_code_application_splace_screen_light_theme.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                  text: 'QR Capture',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          children: [
                            TextSpan(
                                text: 'Develop by jeetu\n\n',
                                style: TextStyle(
                                  letterSpacing: 2,
                                  color: Colors.black45,
                                )),
                            TextSpan(
                              text: "© Version 1.0.1.0",
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ));
  }
}
