import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../styles/colors.dart';

OutlinedButton secondaryButton(
    {required String text, required Function()? onPressed}) {
  return myButton(type: 'secondary', text: text, onPressed: onPressed);
}

OutlinedButton primaryButton(
    {required String text,
    required Function()? onPressed,
    required String svgIconPath}) {
  return myButton(
      type: 'primary',
      text: text,
      onPressed: onPressed,
      svgIconPath: svgIconPath);
}

OutlinedButton greenButton(
    {required String text,
    required Function()? onPressed,
    required String svgIconPath}) {
  return myButton(
      type: 'green',
      text: text,
      onPressed: onPressed,
      svgIconPath: svgIconPath);
}

OutlinedButton myButton(
    {required String type,
    required String text,
    required Function()? onPressed,
    String? svgIconPath}) {
  double width = type == 'secondary' ? 125 : 289;
  double height = type == 'secondary' ? 44 : 58;
  Color color = type == 'green' ? Colors.white : buttonPrimery;
  Color background = type == 'green' ? buttonGreen : Colors.white;
  Color shapeColor = type == 'green' ? buttonGreen : buttonPrimery;

  return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(background),
        minimumSize: MaterialStateProperty.all(Size(width, height)),
        padding: MaterialStateProperty.all(
          const EdgeInsets.fromLTRB(32, 16, 32, 18),
        ),
        side: MaterialStateProperty.all(BorderSide(
          color: shapeColor,
        )),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          svgIconPath != null
              ? Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: SvgPicture.asset(
                    svgIconPath,
                    width: 24,
                    height: 24,
                  ),
                )
              : Container(),
        ],
      ));
}
