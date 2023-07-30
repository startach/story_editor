// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../styles/colors.dart';

class ImageToShare extends StatelessWidget {
  final Image myImage;
  final String? description;
  final Widget? logo;
  const ImageToShare(
      {super.key, required this.myImage, this.description = '', this.logo});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        myImage,
        if (logo != null)
          Positioned.fill(
            child: Stack(children: [
              Container(
                height: 30,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: gradient,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              Positioned(
                top: 15.0,
                right: 15.0,
                child: logo!,
              ),
            ]),
          ),
        if (description != null)
          Positioned.fill(
            child: Stack(children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: gradient,
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  child: SvgPicture.asset(
                    'assets/images/description_frame.svg',
                    color: null,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      description!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Assistant',
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.50,
                      ),
                    )),
              )
            ]),
          ),
      ],
    );
  }
}
