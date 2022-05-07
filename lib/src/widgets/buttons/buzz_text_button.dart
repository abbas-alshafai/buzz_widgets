import 'package:flutter/material.dart';

class BuzzTextButton extends StatelessWidget {
  const BuzzTextButton({
    Key? key,
    this.text,
    this.onPressed,
    this.height,
  }) : super(key: key);

  final String? text;
  final double? height;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final button = TextButton(
      child: Text(text ?? ''),
      onPressed: onPressed,
    );

    if (height == null) {
      return button;
    }

    return SizedBox(
      height: height,
      child: button,
    );
  }
}
