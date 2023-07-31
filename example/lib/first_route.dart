import 'package:flutter/material.dart';
import 'second_route.dart';
import 'utils/my_camera.dart';
import 'dart:io';
import 'utils/elevated_button.dart';

const kButtonColor = Color.fromARGB(200, 88, 182, 108);
const kButtonBorderColor = Color.fromARGB(200, 51, 108, 160);
const kButtonTextStyle = TextStyle(fontWeight: FontWeight.bold);
const kButtonPadding = EdgeInsets.fromLTRB(0.0, 35.0, 0.0, 35.0);

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.black,
            size: 20,
          ), // use Colors.black to make the icon black
          onPressed: () {
            // Define the action when close icon is pressed
          },
        ),
      ),
      body: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //SizedBox(height: 20.0,),
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: const Image(
                    image: AssetImage('assets/routeOne.jpg'),
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                CustomElevatedButton(
                  color: kButtonColor,
                  onPressed: () async {
                    File? myImage = await MyCamera.takePicture();
                    myImage != null
                        // ignore: use_build_context_synchronously
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  SecondRoute(myImage: Image.file(myImage)),
                            ))
                        : () {};
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //SizedBox(height: 20.0,),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                          0.0,
                          35.0,
                          0.0,
                          35.0,
                        ),
                      ),
                      Text(
                        'שיתוף תמונה',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Icon(Icons.camera_alt_outlined)
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                CustomElevatedButton(
                  color: Colors.white,
                  borderColor: kButtonBorderColor,
                  onPressed: () {
                    //final myImage = File('assets\routeOne.jpg');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondRoute()),
                    );
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //SizedBox(height: 20.0,),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                          0.0,
                          35.0,
                          0.0,
                          35.0,
                        ),
                      ),
                      Text(
                        'שיתוף ארוע',
                        style: TextStyle(
                          color: Color.fromARGB(200, 51, 108, 160),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Image(
                        image: AssetImage('assets/event.jpg'),
                        height: 25.0,
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
