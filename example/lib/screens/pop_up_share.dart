import 'package:flutter/material.dart';
import '../styles/my_icons.dart';
import '../widgets/my_buttons.dart';
// import 'share_screen.dart';

class PopUpShare extends StatelessWidget {
  const PopUpShare({super.key});
  final String shareImageButtonText = 'שיתוף תמונה';
  final String shareEventButtonText = 'שיתוף ארוע';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .10,
            alignment: Alignment.bottomLeft,
            child: CloseButton(
              onPressed: () {},
            ),
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * .80,
              height: MediaQuery.of(context).size.height * .85,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Image.asset(
                      'assets/images/main.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(
                        height: 32,
                      ),
                      greenButton(
                        text: shareImageButtonText,
                        svgIconPath: iconCamera,
                        onPressed: () {
                          Navigator.pushNamed(context, '/shareImage');
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) =>
                          //         const ShareScreen(shareType: 'image'),
                          //   ),
                          // );
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      primaryButton(
                        text: shareEventButtonText,
                        svgIconPath: iconEvent,
                        onPressed: () {
                          Navigator.pushNamed(context, '/shareEvent');
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) =>
                          //           const ShareScreen(shareType: 'event')),
                          // );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
