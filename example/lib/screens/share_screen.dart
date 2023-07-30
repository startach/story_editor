import 'dart:io';
import 'package:flutter/material.dart';
import '../utils/my_camera.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../styles/my_icons.dart';
import '../widgets/my_buttons.dart';
import '../widgets/logo_ydidim.dart';
import '../widgets/stack_image.dart';

class ShareScreen extends StatefulWidget {
  final String shareType;
  const ShareScreen({super.key, required this.shareType});

  @override
  State<ShareScreen> createState() => _ShareScreenState();
}

class _ShareScreenState extends State<ShareScreen> {
  Widget? imageToShare;
  String newPicButtonText = 'צילום חדש';
  String shareViaText = 'שיתוף באמצעות';
  String descriptionText = '!גאה להתנדב בידידים';
  List<List> iconsList = [
    ['Instagram', iconInstegram],
    ['Facebook', iconFacebook],
    ['Whatsapp', iconWhatsapp]
  ];

  @override
  void initState() {
    super.initState();
    if (widget.shareType == 'image') {
      setImage();
    }
  }

  void setImage() async {
    File? myImage = await MyCamera.takePicture();
    if (myImage != null) {
      setState(() {
        imageToShare = ImageToShare(
          myImage: Image.file(myImage),
          logo: const LogoYedidim(width: 100),
          description: descriptionText,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (imageToShare == null && widget.shareType == 'image') {
      return const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [CircularProgressIndicator(), Text('Loading')],
      );
    }
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),
            Expanded(
                child: widget.shareType == 'event'
                    ? Image.asset('assets/images/main.png')
                    : imageToShare!),
            const SizedBox(
              height: 32,
            ),
            SizedBox(
              width: 154,
              height: 180,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    shareViaText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5400000214576721),
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 0.50,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: iconsList
                        .map((e) => Column(
                              children: [
                                SvgPicture.asset(
                                  e[1],
                                  height: 32,
                                  width: 32,
                                ),
                                Text(
                                  e[0],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.20,
                                  ),
                                ),
                              ],
                            ))
                        .toList(),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  widget.shareType == 'image'
                      ? secondaryButton(
                          text: newPicButtonText,
                          onPressed: () {
                            setImage();
                          })
                      : secondaryButton(
                          text: newPicButtonText, onPressed: () {})
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .07,
            )
          ]),
    ));
  }
}
