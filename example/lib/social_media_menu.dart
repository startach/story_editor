import 'package:flutter/widgets.dart';

class SocialMediaMenu extends StatelessWidget {
  const SocialMediaMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blue,
      child: const Image(
        image: AssetImage('images/social_media_hack.png'),
      ),
    );
  }
}
