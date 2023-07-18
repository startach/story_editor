import 'package:ex1/screens/share_image.dart';
import 'package:ex1/styles/colors.dart';
import 'package:ex1/utils/my_camera.dart';
import 'package:ex1/widgets/main_icon_button.dart';
import 'package:ex1/widgets/share_bunner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../dictionary.dart';

class PopupShareScreen extends StatefulWidget {
  const PopupShareScreen({super.key});

  @override
  State<PopupShareScreen> createState() => _PopupShareScreenState();
}

class _PopupShareScreenState extends State<PopupShareScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/close.svg',
              height: 28,
              width: 28,
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const ShareBunner(),
            const SizedBox(
              height: 40,
            ),
            MainIconButton(
              onPressed: () async {
                var file = await MyCamera.takePicture();
                if (file == null) {
                  return;
                }
                if (context.mounted) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => ShareImage(image: file),
                    ),
                  );
                }
              },
              backgroundColor: primaryGreen,
              label:
                  dictionary['sharePicture']?[Languages.eb] ?? 'Share Picture',
              icon: SvgPicture.asset('assets/icons/camera.svg'),
              foregroundColor: Colors.white,
            ),
            const SizedBox(
              height: 16,
            ),
            MainIconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => const ShareImage(),
                  ),
                );
              },
              borderColor: primaryBlue,
              label: dictionary['shareEvent']?[Languages.eb] ?? 'Share Event',
              icon: SvgPicture.asset('assets/icons/myEvents2.svg'),
              foregroundColor: primaryBlue,
            ),
          ],
        ),
      ),
    );
  }
}
