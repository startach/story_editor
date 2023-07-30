import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final Color color;
  final Color borderColor;
  final VoidCallback onPressed;
  final Widget child;

  const CustomElevatedButton({
    super.key,
    required this.color,
    required this.onPressed,
    required this.child,
    this.borderColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 40.0, right: 40.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),
          ),
          side: BorderSide(
            width: 2.0,
            color: borderColor,
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(padding: EdgeInsets.fromLTRB(0.0, 35.0, 0.0, 35.0)),
            child,
          ],
        ),
      ),
    );
  }
}
