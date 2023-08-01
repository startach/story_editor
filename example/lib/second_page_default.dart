import 'package:flutter/material.dart';

class SecondPageDefault extends StatelessWidget {
  const SecondPageDefault({super.key});
  final String firstImage = 'web/assets/img1.png';
  final String secondImage = 'web/assets/img2.png';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0x13000000),
                    blurRadius: 8.0,
                  ),
                ],
              ),
              child: Image.asset(firstImage),
            ),
            const SizedBox(height: 20),
            Image.asset(
              secondImage,
              width: 150,
              height: 100,
            ),
            const SizedBox(height: 20),
          ]),
    )));
  }
}
