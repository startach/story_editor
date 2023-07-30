import 'package:flutter/material.dart';

class ShareButton extends StatelessWidget {
  final String assetName;
  final String platformName;

  const ShareButton({
    required this.assetName,
    required this.platformName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      child: Column(
        children: [
          Image(
            image: AssetImage(assetName),
            width: 40,
          ),
          const SizedBox(height: 5),
          Text(
            platformName,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 9,
            ),
          )
        ],
      ),
    );
  }
}
