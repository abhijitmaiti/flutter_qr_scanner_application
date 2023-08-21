import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_code/widget/QRScannerOverlay.dart';
import 'package:qr_code/screen/ScanedCodeScreen.dart';

class QRScanner extends StatefulWidget {
  const QRScanner({super.key});

  @override
  State<QRScanner> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  bool isScanComplete = false;
  bool isFlash = false;
  MobileScannerController controller = MobileScannerController();

  void closeScreen() {
    isScanComplete = false;
  }

  @override
  Widget build(BuildContext context) {
    final bool textColor =
        MediaQuery.of(context).platformBrightness == Brightness.dark
            ? true
            : false;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Center(
              child: Text(
            "QR Capture",
            style: textColor
                ? const TextStyle(color: Colors.white)
                : const TextStyle(color: Colors.black),
          )),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                child: Center(
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        TextSpan(
                          text: "Place QR inside the frame\n\n",
                          style: !textColor
                              ? const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                )
                              : const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                        ),
                        TextSpan(
                          text: "QR will be automatically scanned",
                          style: !textColor
                              ? const TextStyle(
                                  fontSize: 13,
                                  color: Colors.black45,
                                )
                              : const TextStyle(
                                  fontSize: 13,
                                  color: Colors.white38,
                                ),
                        )
                      ])),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                  padding: const EdgeInsets.only(right: 40, left: 40),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0)),
                        child: MobileScanner(
                          controller: controller,
                          allowDuplicates: true,
                          onDetect: (barcode, args) {
                            if (!isScanComplete) {
                              String code = barcode.rawValue ?? '---';
                              setState(() {
                                isScanComplete = true;
                              });
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return ScanedCode(
                                      code: code, closeScreen: closeScreen);
                                },
                              );
                            }
                          },
                        ),
                      ),
                      const QRScannerOverlay(overlayColour: Colors.black38),
                      Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10, right: 5),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  isFlash = !isFlash;
                                });
                                controller.toggleTorch();
                              },
                              icon: !isFlash
                                  ? const Icon(
                                      Icons.flash_off,
                                      color: Colors.white,
                                    )
                                  : const Icon(Icons.flash_on,
                                      color: Colors.white),
                            ),
                          ))
                    ],
                  )),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Center(
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        TextSpan(
                          text: "Develop by jeetu\n\n",
                          style: !textColor
                              ? const TextStyle(
                                  color: Colors.black45, letterSpacing: 2)
                              : const TextStyle(
                                  color: Colors.white38, letterSpacing: 2),
                        ),
                        TextSpan(
                            text: "© Version 1.0.1.0",
                            style: !textColor
                                ? const TextStyle(
                                    color: Colors.black45,
                                    fontSize: 12,
                                  )
                                : const TextStyle(
                                    color: Colors.white38,
                                    fontSize: 12,
                                  ))
                      ])),
                ),
              ),
            )
          ],
        ));
  }
}
