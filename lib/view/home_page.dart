import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_scan_and_generate_app/common/image_to_qr.dart';
import 'package:qr_scan_and_generate_app/view/result_page.dart';

import '../common/nav_bar.dart';

class HomePage extends StatefulWidget {
  static const String route = '/';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Define your color scheme (replace with actual colors from your design)
  static const Color primaryColor = Color(0xFF2196F3); // Example blue
  static const Color primaryTextColor = Color(0xFF212121);
  static const Color secondaryTextColor = Color(0xFF757575);
  static const Color backgroundColor = Color(0xFFFFFFFF);

  late MobileScannerController controller;
  bool _isScanning = true;
  bool isFlashOn = false;

  @override
  void initState() {
    super.initState();
    _initializeScanner();
  }

  void _initializeScanner() {
    controller = MobileScannerController(
      autoStart: true,
      detectionSpeed: DetectionSpeed.noDuplicates,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _handleDetection(BarcodeCapture barcode) {
    if (!_isScanning) return;

    final String? code = barcode.barcodes.firstOrNull?.rawValue;
    if (code != null) {
      setState(() => _isScanning = false);
      controller.stop();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(qrData: code),
        ),
      ).then((_) {
        if (mounted) {
          setState(() {
            _isScanning = true;
            controller.start();
          });
        }
      });
    }
  }

  void _onDetectError(Object error, StackTrace stackTrace) {
    print("Error occurred during QR scanning: $error");

    // Optionally, show an error message to the user
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Scan Error"),
          content: Text("An error occurred during the QR scan: $error"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  XFile? _selectedImage;

  Future<void> _pickImage() async {
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxWidth: 600,
        maxHeight: 600,
        imageQuality: 100,
      );
      if (image != null) {
        setState(() {
          _selectedImage = image;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ImgProcess(image: _selectedImage!),
            ),
          );
        });
        // Handle image upload logic here
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              iconSize: 24,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              icon: Icon(Icons.image, color: Colors.white),
              onPressed: _pickImage,
            ),
            // IconButton(
            //   iconSize: 24,
            //   padding: EdgeInsets.zero,
            //   constraints: const BoxConstraints(),
            //   icon: Icon(Icons.flash_on,
            //       color: isFlashOn ? Colors.yellow : Colors.white),
            //   onPressed: () async {
            //     try {
            //       if (isFlashOn) {
            //         await TorchLight.disableTorch();
            //       } else {
            //         await TorchLight.enableTorch();
            //       }
            //       isFlashOn = !isFlashOn;
            //     } catch (e) {
            //       debugPrint('Flash toggle error: $e');
            //     }
            //   },
            // ),
            IconButton(
              iconSize: 24,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              icon: const Icon(Icons.cameraswitch, color: Colors.white),
              onPressed: () async {
                await controller.switchCamera();
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        'Scan QR Code',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: primaryTextColor,
                        ),
                      ),
                    ),
                    Text(
                      _isScanning ? 'Place QR code in the frame' : "Scan Done!",
                      style: TextStyle(
                        color: secondaryTextColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: SizedBox(
                      width: 300,
                      height: 300,
                      // decoration: BoxDecoration(
                      //   border: Border.all(
                      //       color: const Color(0xFF089BD4), width: 2),
                      //   borderRadius: BorderRadius.circular(20),
                      // ),
                      child: MobileScanner(
                        // scanWindow: Rect.fromCenter(center: Offset(150, 150), width: 290, height: 290),
                        controller: controller,
                        onDetect: _handleDetection,
                        onDetectError: _onDetectError,
                      )),
                ),
                Spacer(),
              ],
            ),
          ),
          buildBottomNavigation(context),
        ],
      ),
    );
  }
}
