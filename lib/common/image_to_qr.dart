import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart'
    as mlkit;
import 'package:image_picker/image_picker.dart';

import '../models/enums.dart';
import '../view/result_page.dart';

class ImgProcess extends StatefulWidget {
  final XFile image;
  const ImgProcess({super.key, required this.image});

  @override
  State<ImgProcess> createState() => _ImgProcessState();
}

class _ImgProcessState extends State<ImgProcess> {
  bool isScanning = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scanQrCode();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Scan QR Code")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            kIsWeb
                ? Image.network(widget.image.path, height: 250)
                : Image.file(File(widget.image.path), height: 250),
            const SizedBox(height: 20),
            if (isScanning) const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }

  Future<void> scanQrCode() async {
    setState(() => isScanning = true);

    final inputImage = mlkit.InputImage.fromFilePath(widget.image.path);
    final barcodeScanner = mlkit.BarcodeScanner(
      formats: [mlkit.BarcodeFormat.qrCode],
    );

    try {
      final barcodes = await barcodeScanner.processImage(inputImage);

      if (barcodes.isNotEmpty) {
        final resultText = barcodes.first.rawValue ?? "QR code has no data.";

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ResultPage(
              qrData: resultText,
              imageFile: File(widget.image.path),
              source: ScanSource.fromImage,
            ),
          ),
        );
      } else {
        _showMessage("No QR code found.");
      }
    } catch (e) {
      _showMessage("Error scanning QR code: $e");
    } finally {
      barcodeScanner.close();
      setState(() => isScanning = false);
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: Duration(seconds: 2)),
    );
  }
}
