import 'package:flutter/material.dart';

const kGradientColors = [
  Color.fromRGBO(0, 0, 0, 1.0), // Fully opaque black
  Color.fromRGBO(0, 0, 0, 0.3), // Black with 30% opacity
  Color.fromRGBO(0, 0, 0, 0.1), // Black with 10% opacity
  Colors.transparent,
];

class MyLinearGradient extends StatelessWidget {
  final String alignment;
  final String alignmentBegin;
  final String alignmentEnd;

  static const alignments = {
    "topCenter": Alignment.topCenter,
    "bottomCenter": Alignment.bottomCenter,
    // Add any other alignments you want to support here
  };

  const MyLinearGradient({
    Key? key,
    required this.alignment,
    required this.alignmentBegin,
    required this.alignmentEnd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final alignments = {
      "topCenter": Alignment.topCenter,
      "bottomCenter": Alignment.bottomCenter,
    };
    return Positioned.fill(
      child: FractionallySizedBox(
        alignment: alignments[alignment]!,
        heightFactor: 0.16,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: alignments[alignmentBegin]!,
              end: alignments[alignmentEnd]!,
              colors: kGradientColors,
            ),
          ),
        ),
      ),
    );
  }
}
