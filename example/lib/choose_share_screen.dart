import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:story_editor_example/share_image_secreen.dart';

import 'medal_icons.dart';
import 'share_button.dart';
import 'share_incident_screen.dart';
import 'yedidim_thanks.dart';

class ChooseShareScreen extends StatelessWidget {
  const ChooseShareScreen({super.key});

  static const String shareIncidentText = 'שיתוף ארוע';
  static const String shareImageText = 'שיתוף תמונה';

  static VoidCallback navigate(BuildContext context, Widget nextScreen) {
    return () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ShareIncidentScreen(nextScreen)),
        );
  }

  // void

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
              onPressed: navigate(context, const YedidimThanks()),
            ),
            const SizedBox(height: 16),
            ShareButton(
              const Color.fromARGB(255, 88, 182, 108),
              Colors.white,
              shareImageText,
              Icons.camera_alt_outlined,
              onPressed: () async {
                var imageFile = await takePicture();
                if (imageFile == null || !context.mounted) return;
                navigate(context, ImageShow(imageFile))();
              },
            ),
          ],
        ),
      ),
    );
  }
}

Future<File?> takePicture() async {
  try {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return null;
    return File(image.path);
  } on Exception catch (e) {
    // should catch only PlatformException
    if (kDebugMode) print('Failed to pick image: $e');
    return null;
  }
}
