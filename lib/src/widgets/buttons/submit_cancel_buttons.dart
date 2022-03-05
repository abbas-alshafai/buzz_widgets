import 'package:flutter/material.dart';

class BuzzSubmitCancelButtons extends StatelessWidget {
  const BuzzSubmitCancelButtons({
    Key? key,
    this.onSubmit,
    this.onCancel,
    this.submitText,
    this.cancelText,
    this.spaceBetween,
  }) : super(key: key);

  final VoidCallback? onSubmit;
  final VoidCallback? onCancel;
  final String? submitText;
  final String? cancelText;
  final double? spaceBetween;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TextButton(
            child: Text(cancelText ?? 'Cancel'),
            onPressed: onCancel,
          ),
        ),
        SizedBox(width: spaceBetween ?? 16),
        Expanded(
          child: ElevatedButton(
            child: Text(submitText ?? 'Submit'),
            onPressed: onSubmit,
          ),
        ),
      ],
    );
  }
}
