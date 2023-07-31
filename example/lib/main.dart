import 'package:flutter/material.dart';
import './screens/share_screen.dart';
import './screens/pop_up_share.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Assistant',
        canvasColor: Colors.white,
        useMaterial3: true,
      ),
      // home: const Directionality(
      //     textDirection: TextDirection.rtl, child: PopUpShare()),
      routes: {
        '/': (context) => const PopUpShare(),
        '/shareImage': (context) => const ShareScreen(shareType: 'image'),
        '/shareEvent': (context) => const ShareScreen(shareType: 'event')
      },
    );
  }
}
