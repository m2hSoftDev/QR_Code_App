import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../common/icon_design.dart';
import '../common/nav_bar.dart';

class GeneratePage extends StatelessWidget {
  const GeneratePage({super.key});

  @override
  Widget build(BuildContext context) {
    const String route = "/generate";
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: ThemeData.light().iconTheme,
          backgroundColor: Colors.white,
          elevation: 5,
          shadowColor: Colors.black,
          centerTitle: true,
          title: Text(
            "Generate QR Code",
            style: TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w500),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      WebsiteIconWidget(context,
                          Icon(Icons.text_fields_rounded), "Text", () {}),
                      WebsiteIconWidget(
                          context,
                          Icon(Icons.perm_contact_cal_rounded),
                          "Contact",
                          () {}),
                      WebsiteIconWidget(
                          context, Icon(Icons.wifi), "Wifi", () {}),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      WebsiteIconWidget(
                          context, Icon(Icons.web), "Website", () {}),
                      WebsiteIconWidget(
                          context, Icon(Icons.event), "Event", () {}),
                      WebsiteIconWidget(
                          context, Icon(Icons.business), "Business", () {}),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      WebsiteIconWidget(
                          context, Icon(Icons.facebook), "Facebook", () {}),
                      WebsiteIconWidget(context,
                          Icon(FontAwesomeIcons.instagram), "Instagram", () {}),
                      WebsiteIconWidget(context,
                          Icon(FontAwesomeIcons.whatsapp), "WhatsApp", () {}),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      WebsiteIconWidget(
                          context, Icon(Icons.location_on), "Location", () {}),
                      WebsiteIconWidget(
                          context, Icon(Icons.call), "Telephone", () {}),
                      WebsiteIconWidget(
                          context, Icon(Icons.email_outlined), "Email", () {}),
                    ],
                  ),
                ],
              ),
            ),
            buildBottomNavigation(context),
          ],
        ),
      ),
    );
  }
}
