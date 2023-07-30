import 'package:flutter/material.dart';

import 'social_media_menu.dart';
import 'yedidim_thanks.dart';

class ShareIncidentScreen extends StatelessWidget {
  const ShareIncidentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 32),
        alignment: Alignment.center,
        child: Column(
          children: [
            // const Row(children: [CloseButton()]),
            const SizedBox(height: 40),
            const YedidimThanks(),
            const SizedBox(height: 32),
            Text(
              'שיתוף באמצעות',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black.withOpacity(0.54),
                fontSize: 18,
                fontFamily: 'Assistant',
                fontWeight: FontWeight.w300,
                // height: 20,
                letterSpacing: 0.50,
              ),
            ),
            const SizedBox(height: 16),
            const SocialMediaMenu(),
          ],
        ),
      ),
    );
  }
}
