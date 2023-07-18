import 'package:ex1/screens/popup_share.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Assistant'),
      home: const PopupShareScreen(),
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child ??
              const Center(
                child: Text('problem'),
              ),
        );
      },
    ),
  );
}
