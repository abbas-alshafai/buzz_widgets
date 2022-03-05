import 'package:buzz_widgets/src/widgets/buttons/submit_cancel_buttons.dart';
import 'package:buzz_widgets/src/widgets/form/form.dart';
import 'package:flutter/material.dart';

class BuzzFormWrapper extends StatelessWidget {
  const BuzzFormWrapper({
    Key? key,
    List<Widget>? children,
    this.submitWidget,
    this.formKey,
    this.onSubmit,
    this.onCancel,
    this.submitText,
    this.cancelText,
    this.spaceBetween,
  })  : children = children ?? const [],
        super(key: key);

  final List<Widget> children;
  final Widget? submitWidget;
  final Key? formKey;

  final VoidCallback? onSubmit;
  final VoidCallback? onCancel;
  final String? submitText;
  final String? cancelText;
  final double? spaceBetween;

  @override
  Widget build(BuildContext context) {
    final isEmptySubmit = onSubmit == null &&
        onCancel == null &&
        submitText == null &&
        cancelText == null &&
        spaceBetween == null;

    final _submitWidget = submitWidget ?? (isEmptySubmit
        ? null
        : BuzzSubmitCancelButtons(
      onSubmit: onSubmit,
      onCancel: onCancel,
      submitText: submitText,
      cancelText: cancelText,
      spaceBetween: spaceBetween,
    ));


    final form = BuzzForm(
      formKey: formKey,
      children: children,
    );

    return _submitWidget == null
        ? form
        : Column(
            children: [
              Expanded(child: form),
              _submitWidget,
            ],
          );
  }
}
