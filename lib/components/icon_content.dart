import 'package:flutter/material.dart';
import '../constant.dart';

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
          style: KLabelTextStyle,
        ),
      ],
    );
  }
}
