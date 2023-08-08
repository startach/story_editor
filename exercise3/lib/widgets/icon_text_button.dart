import 'package:flutter/material.dart';

class IconTextButton extends StatelessWidget {
  const IconTextButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.name,
    required this.size,
  });

  final void Function() onPressed;
  final Widget icon;
  final String name;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            iconSize: size,
            icon: icon,
            onPressed: () {},
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            splashRadius: 22,
          ),
          Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 8,
              letterSpacing: 0.2,
            ),
          ),
        ],
      ),
    );
  }
}
