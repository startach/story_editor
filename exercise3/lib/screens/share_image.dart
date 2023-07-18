import 'dart:io';

import 'package:ex1/utils/my_camera.dart';
import 'package:ex1/widgets/image_display.dart';
import 'package:ex1/widgets/share_bunner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../dictionary.dart';
import '../widgets/icon_text_button.dart';
import '../widgets/logo.dart';
import '../widgets/main_button.dart';

const Map<String, String> socials = {
  'whatsapp': 'assets/icons/whatsapp.svg',
  'facebook': 'assets/icons/facebook.svg',
  'instagram': 'assets/icons/Instagram.svg'
};

class ShareImage extends StatefulWidget {
  const ShareImage({
    super.key,
    this.image,
  });

  final File? image;

  @override
  State<ShareImage> createState() => _ShareImageState();
}

class _ShareImageState extends State<ShareImage> {
  File? _selectedImage;
  @override
  void initState() {
    if (widget.image != null) {
      _selectedImage = widget.image;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 24),
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              widget.image == null
                  ? const ShareBunner()
                  : ImageDisplay(
                      image: _selectedImage!,
                      title: dictionary['proud']?[Languages.eb] ?? 'So proud',
                      logo: const Logo(color: Colors.white),
                    ),
              const SizedBox(
                height: 32,
              ),
              Text(
                dictionary['shareBy']?[Languages.eb] ?? 'Share By',
                style: const TextStyle(
                  color: Color.fromARGB(137, 0, 0, 0),
                  fontWeight: FontWeight.w300,
                  height: 1.34,
                  letterSpacing: .5,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var item in socials.entries)
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: IconTextButton(
                          size: 32.0,
                          name: item.key,
                          onPressed: () {},
                          icon: SvgPicture.asset(item.value)),
                    ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              if (_selectedImage != null)
                MainButton(
                  onPressed: () async {
                    var file = await MyCamera.takePicture();
                    if (file == null) {
                      return;
                    }
                    setState(() {
                      _selectedImage = file;
                    });
                  },
                  foregroundColor: const Color.fromARGB(255, 51, 108, 160),
                  borderColor: const Color.fromARGB(255, 51, 108, 160),
                  label: dictionary['reTakePicture']?[Languages.eb] ??
                      'Re Take Picture',
                )
            ],
          ),
        ),
      ),
    );
  }
}
