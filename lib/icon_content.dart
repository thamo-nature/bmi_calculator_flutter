import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  const IconContent({
    super.key,
    required this.genderText,
    required this.genderIcon,
  });

  final String genderText;
  final IconData genderIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          genderIcon,
          size: 80,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          genderText,
          style: const TextStyle(fontSize: 20),
        )
      ],
    );
  }
}
