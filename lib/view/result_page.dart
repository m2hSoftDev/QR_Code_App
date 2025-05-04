import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

import '../models/enums.dart';



class ResultPage extends StatelessWidget {
  static const String route = '/result';

  final String qrData;
  final File? imageFile;
  final ScanSource source;

  const ResultPage({
    super.key,
    required this.qrData,
    this.imageFile,
    this.source = ScanSource.liveCamera,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 24),
          title: Text("Scanning Result"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (source == ScanSource.fromImage && imageFile != null)
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.file(imageFile!, height: 200),
              ),
            const SizedBox(height: 20),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(color: Colors.grey.shade400),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text('Data Found!',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                    Text(qrData),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _iconButton(() => Share.share(qrData), Icons.share),
                        const SizedBox(width: 20),
                        _iconButton(() {
                          Clipboard.setData(ClipboardData(text: qrData));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Data Copied!"),
                                duration: Duration(seconds: 1)),
                          );
                        }, Icons.copy),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _iconButton(VoidCallback onTap, IconData icon) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: Colors.blueAccent,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Icon(icon, size: 40, color: Colors.white),
        ),
      ),
    );
  }
}
