import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'utils/my_camera.dart';
import 'dart:io';
import 'utils/vector_list.dart';
import 'utils/share_button.dart';
import 'utils/style.dart';
import 'utils/linear_gradient.dart';

// ignore: must_be_immutable
class SecondRoute extends StatelessWidget {
  Image? myImage; // Make the Image nullable
  Image defaultImage = Image.asset('assets/routeOne.jpg');

  SecondRoute({this.myImage, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Stack(
                  children: [
                    myImage ?? defaultImage,
                    if (myImage != null) ...[
                      const MyLinearGradient(
                        alignment: "topCenter",
                        alignmentBegin: "topCenter",
                        alignmentEnd: "bottomCenter",
                      ),
                      Positioned.fill(
                        child: FractionallySizedBox(
                          alignment: Alignment.topCenter,
                          heightFactor: 0.16,
                          child: Stack(
                            children: [
                              Positioned(
                                right: 15,
                                top: 15,
                                width: 35,
                                height: 35,
                                child: SvgPicture.asset(
                                  'assets/logo.svg',
                                ),
                              ),
                              Positioned(
                                top: 22,
                                right: 60,
                                child:
                                    SvgPicture.asset('assets/YedidimLogo.svg'),
                              )
                            ],
                          ),
                        ),
                      ),
                      const MyLinearGradient(
                        alignment: "bottomCenter",
                        alignmentBegin: "bottomCenter",
                        alignmentEnd: "topCenter",
                      ),
                      Positioned.fill(
                        child: FractionallySizedBox(
                          alignment: Alignment.bottomCenter,
                          heightFactor: 0.16,
                          child: Stack(
                            children: [
                              ...vectors.asMap().entries.map((entry) {
                                Map<String, dynamic> vector = entry.value;

                                return Positioned(
                                  left: vector['left'],
                                  bottom: vector['bottom'],
                                  width: vector['width'],
                                  height: vector['height'],
                                  child: SvgPicture.asset(
                                    'assets/vectors/Vector${entry.key + 1}.svg',
                                  ),
                                );
                              }).toList(),
                              const Center(
                                child: Text('!גאה להתנדב בידידים',
                                    textAlign: TextAlign.center,
                                    style: kBottomTextStyle),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 45),
              const Text(
                'שיתוף באמצעות',
                style: kShareTextStyle,
              ),
              const SizedBox(height: 15),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ShareButton(
                    assetName: 'assets/instagram.jpg',
                    platformName: 'Instagram',
                  ),
                  ShareButton(
                    assetName: 'assets/facebook.jpg',
                    platformName: 'Facebook',
                  ),
                  ShareButton(
                    assetName: 'assets/whatsapp.jpg',
                    platformName: 'Whatsapp',
                  ),
                ],
              ),
              const SizedBox(height: 45),
              if (myImage != null)
                ElevatedButton(
                  onPressed: () async {
                    File? myImage = await MyCamera.takePicture();
                    myImage != null
                        // ignore: use_build_context_synchronously
                        ? Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  SecondRoute(myImage: Image.file(myImage)),
                            ))
                        : () {};
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: Colors.white,
                    side: const BorderSide(
                        color: Color.fromARGB(255, 51, 108, 160), width: 1),
                    fixedSize: const Size(125, 44),
                    elevation: 0,
                  ),
                  child: const Text(
                    'צילום חדש',
                    style: kNewPhotoTextStyle,
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
