import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'utils.dart';

//ignore: must_be_immutable
class SecondPage extends StatefulWidget {
  SecondPage({
    Key? key,
    required this.image,
  }) : super(key: key);

  XFile image;

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final String upOnImage = 'web/assets/watermark.png';
  final String downOnImage = 'web/assets/bottom_watermark.png';
  final String iconsImage = 'web/assets/img2.png';
  final String retakeImage = 'web/assets/secondary.png';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x13000000),
                          blurRadius: 8.0,
                        ),
                      ],
                    ),
                    child: Image.file(File(widget.image.path)),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Image.asset(upOnImage),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Image.asset(downOnImage),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Image.asset(
              iconsImage,
              width: 150,
              height: 100,
            ),
            TextButton(
                onPressed: () async {
                  XFile retakeImage = await takePicture();
                  setState(() {
                    widget.image = retakeImage;
                  });
                },
                child: Image.asset(retakeImage)),
          ]),
    )));
  }
}
