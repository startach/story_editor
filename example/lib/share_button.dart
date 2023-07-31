import 'package:flutter/material.dart';

class ShareButton extends StatelessWidget {
  const ShareButton(
      this.backgroundColor, this.foregroundColor, this.text, this.icon,
      {super.key, this.onPressed = doNothing});

  final Color backgroundColor;
  final Color foregroundColor;
  final String text;
  final IconData icon;

  final void Function() onPressed;
  static void doNothing() {}

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        padding: const EdgeInsets.only(
          top: 16,
          left: 32,
          right: 32,
          bottom: 18,
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 15,
              fontFamily: 'Assistant',
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 8),
          Icon(icon),
        ],
      ),
    );
  }
}
