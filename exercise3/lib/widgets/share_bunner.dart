import 'package:ex1/dictionary.dart';
import 'package:ex1/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShareBunner extends StatelessWidget {
  const ShareBunner({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.7,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 32,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Logo(),
            SvgPicture.asset('assets/icons/topFrame.svg'),
            Text(
              dictionary['thankYou']?[Languages.eb] ?? 'Thank You',
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  height: 1.34,
                  letterSpacing: 0.5),
            ),
            SvgPicture.asset(
              'assets/icons/medal.svg',
              height: 200,
              width: 200,
            ),
            Text(
              dictionary['fullOfJoy']?[Languages.eb] ??
                  'the world will be full of joy',
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 0.5,
                  height: 1.34),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              dictionary['proud']?[Languages.eb] ?? 'So proud',
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                  height: 1.34),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
