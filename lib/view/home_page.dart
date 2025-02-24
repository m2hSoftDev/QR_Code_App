import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
        setState(() => _selectedImage = image);
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
            IconButton(
              iconSize: 24,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              icon: Icon(Icons.flash_on, color: Colors.white),
              onPressed: () {
                // Implement dark mode toggle
                // This would typically use a state management solution
              },
            ),
            IconButton(
              iconSize: 24,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              icon: Icon(Icons.cameraswitch, color: Colors.white),
              onPressed: () {
                // Implement camera switch
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Column(
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
                      'Scanning',
                      style: TextStyle(
                        color: secondaryTextColor,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0xFF089BD4), width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  // Replace with actual QR scanner widget
                  child: const Placeholder(),
                ),
              ],
            ),
          ),
          buildBottomNavigation(context),
        ],
      ),
    );
  }
}
