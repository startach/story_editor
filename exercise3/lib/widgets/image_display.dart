import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImageDisplay extends StatelessWidget {
  const ImageDisplay({
    super.key,
    required this.image,
    this.title,
    this.logo,
  });
  final File image;
  final String? title;
  final Widget? logo;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.file(
            image,
          ),
        ),
        if (logo != null)
          Positioned(
            top: 10,
            right: 10,
            child: logo!,
          ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SvgPicture.asset('assets/icons/bottomWotermarks.svg',
                    fit: BoxFit.fill),
              ),
              Center(
                //alignment: Alignment.bottomCenter,
                child: Text(
                  title ?? '',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.2,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
