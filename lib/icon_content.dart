import 'package:flutter/material.dart';

const TextStyle labelTextStyle = TextStyle(
  fontSize: 18,
  color: Color(0xFF8D8E98),
);

class IconContent extends StatelessWidget {
  final IconData cardIcon;
  final String label;

  IconContent({required this.cardIcon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          cardIcon,
          size: 80,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          label,
          style: labelTextStyle,
        ),
      ],
    );
  }
}
