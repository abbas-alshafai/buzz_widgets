import 'package:buzz_widgets/buzz_widgets.dart';
import 'package:buzz_widgets/src/widgets/buttons/submit_cancel_buttons.dart';
import 'package:buzz_widgets/src/widgets/form/form_wrapper.dart';
import 'package:buzz_widgets/src/widgets/theme/buzz_theme.dart';
import 'package:flutter/material.dart';

class Buzz {
  final BuzzTheme theme;

  Buzz._(this.theme);

  factory Buzz.of(final BuzzTheme theme) => Buzz._(theme);

  Widget formWrapper({
    Key? key,
    List<Widget>? children = const [],
    Widget? submitWidget,
    Key? formKey,
    VoidCallback? onSubmit,
    VoidCallback? onCancel,
    String? submitText,
    String? cancelText,
    double? spaceBetween,
  }) =>
      BuzzFormWrapper(
        key: key,
        children: children,
        submitWidget: submitWidget,
        formKey: formKey,
        spaceBetween: theme.hSpace,
        onSubmit: onSubmit,
        onCancel: onCancel,
        submitText: submitText,
        cancelText: cancelText,
      );
}
