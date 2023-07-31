import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'second_page_default.dart';
import 'second_page.dart';
import 'utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final String firstMainImage = 'web/assets/img1.png';
  final String secondImage = 'web/assets/img-2.png';
  final String thirdImage = 'web/assets/img-3.png';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
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
                child: Image.asset(firstMainImage),
              ),

              const SizedBox(height: 20), // Add some spacing between the images

              IconButton(
                icon: Image.asset(secondImage),
                onPressed: () async {
                  XFile image = await takePicture();
                  // ignore: use_build_context_synchronously
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondPage(image: image),
                    ),
                  );
                },
              ),

              const SizedBox(height: 20), // Add some spacing between the images

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SecondPageDefault()),
                  );
                },
                child: Image.asset(thirdImage),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
