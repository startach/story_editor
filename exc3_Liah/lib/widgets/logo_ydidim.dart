import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoYedidim extends StatelessWidget {
  final double width;
  const LogoYedidim({super.key, this.width = 50});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/images/logo_text.svg',
          width: width * 0.66,
        ),
        SizedBox(width: width * 0.1), // Space between elements
        SvgPicture.asset(
          'assets/images/logo.svg',
          width: width * 0.24,
        ),
      ],
    );
  }
}
