import 'package:flutter/material.dart';

import 'medal_icons.dart';
import 'share_button.dart';
import 'share_incident_screen.dart';
import 'yedidim_thanks.dart';

class ChooseShareScreen extends StatelessWidget {
  const ChooseShareScreen({super.key});

  static const String shareIncidentText = 'שיתוף ארוע';
  static const String shareImageText = 'שיתוף תמונה';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 32),
        alignment: Alignment.center,
        child: Column(
          children: [
            const Row(
              children: [
                SizedBox(
                  child: CloseButton(),
                )
              ],
            ),
            const YedidimThanks(),
            const SizedBox(height: 40),
            ShareButton(
              Colors.white,
              const Color.fromARGB(255, 51, 108, 160),
              shareIncidentText,
              Medal.medal,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ShareIncidentScreen()),
                );
              },
            ),
            const SizedBox(height: 16),
            const ShareButton(
              Color.fromARGB(255, 88, 182, 108),
              Colors.white,
              shareImageText,
              Icons.camera_alt_outlined,
            ),
          ],
        ),
      ),
    );
  }
}
