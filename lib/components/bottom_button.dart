import 'package:flutter/material.dart';
import '../constant.dart';

class BottomButton extends StatelessWidget {
  final String buttonTitle;
  final VoidCallback onTap;

  BottomButton({required this.onTap, required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: KBottomContainerHeight,
        width: double.infinity,
        decoration: BoxDecoration(
          color: KBottomContainerColor,
          borderRadius: BorderRadius.circular(5),
        ),
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(bottom: 5),
        child: Center(
          child: Text(
            buttonTitle,
            style: KLargeButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
