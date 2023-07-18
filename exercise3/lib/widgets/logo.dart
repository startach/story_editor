import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Logo extends StatelessWidget {
  const Logo({super.key, this.color});
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/icons/group.svg',
          height: 32,
          width: 32,
        ),
        const SizedBox(
          width: 10,
        ),
        SvgPicture.asset(
          'assets/icons/yedidim.svg',
          width: 86.67,
          height: 24,
          // ignore: deprecated_member_use
          color: color,
        ),
      ],
    );
  }
}
