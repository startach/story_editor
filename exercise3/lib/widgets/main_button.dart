import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.backgroundColor,
    this.borderColor,
    this.foregroundColor,
  });

  final Color? backgroundColor;
  final Color? borderColor;
  final String label;
  final Color? foregroundColor;

  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
          side: borderColor != null ? BorderSide(color: borderColor!) : null,
          textStyle: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
              height: 1.34),
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          padding: const EdgeInsets.fromLTRB(32, 16, 32, 18),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32))),
      child: Text(label),
    );
  }
}
