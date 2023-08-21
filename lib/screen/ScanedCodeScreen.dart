import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ScanedCode extends StatefulWidget {
  final String code;
  final Function() closeScreen;
  const ScanedCode({super.key, required this.code, required this.closeScreen});

  @override
  State<ScanedCode> createState() => _ScanedCodeState();
}

class _ScanedCodeState extends State<ScanedCode> {
  void copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
  }

  @override
  Widget build(BuildContext context) {
    
    final bool textColor =
        MediaQuery.of(context).platformBrightness == Brightness.dark
            ? true
            : false;

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: textColor
          ? AlertDialog(
              backgroundColor: const Color.fromARGB(255, 50, 49, 49),
              title: const Text(
                "Scanned QR code",
                style: TextStyle(color: Colors.white),
              ),
              content: InkWell(
                  onLongPress: () {
                    copyToClipboard(widget.code);
                    Fluttertoast.showToast(
                        msg: "Clipboard..",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: const Color.fromARGB(255, 79, 77, 77),
                        textColor: Colors.white,
                        fontSize: 16.0);
                  },
                  child:
                      Text(widget.code, style: const TextStyle(color: Colors.white))),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        widget.closeScreen();
                        Navigator.pop(context);
                      },
                      child: const Text("CANCEL",
                          style: TextStyle(color: Colors.orange)),
                    ),
                   
                  ],
                )
              ],
            )
          : AlertDialog(
              backgroundColor: Colors.white,
              title: const Text("Scanned QR code",
                  style: TextStyle(color: Colors.black)),
              content: InkWell(
                  onLongPress: () {
                    copyToClipboard(widget.code);
                    Fluttertoast.showToast(
                        msg: "Clipboard..",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: const Color.fromARGB(255, 79, 77, 77),
                        textColor: Colors.white,
                        fontSize: 16.0);
                  },
                  child:
                      Text(widget.code, style: const TextStyle(color: Colors.black))),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        widget.closeScreen();
                        Navigator.pop(context);
                      },
                      child: const Text("CANCEL",
                          style: TextStyle(color: Colors.orange)),
                    ),
                   
                  ],
                )
              ],
            ),
    );
  }
}
