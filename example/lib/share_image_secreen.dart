import 'dart:io';

import 'package:flutter/material.dart';

class ImageShow extends StatelessWidget {
  const ImageShow(
    this.imageToShare, {
    super.key,
  });

  final File imageToShare;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(image: FileImage(imageToShare)),
        const Positioned(
          top: 10,
          right: 10,
          child: Text("Logo Here"),
        ),
        const Positioned(
          bottom: 15,
          left: 0,
          right: 0,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              "!גאה להתנדב בידידים",
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Assistant',
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
//sdfs