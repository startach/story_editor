import 'package:flutter/material.dart';

class MainIconButton extends StatelessWidget {
  const MainIconButton({
    super.key,
    required this.onPressed,
    required this.label,
    required this.icon,
    this.backgroundColor,
    this.borderColor,
    this.foregroundColor,
  });

  final Color? backgroundColor;
  final Color? borderColor;
  final String label;
  final Color? foregroundColor;
  final Widget icon;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: icon,
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
      label: Text(label),
    );
  }
}
