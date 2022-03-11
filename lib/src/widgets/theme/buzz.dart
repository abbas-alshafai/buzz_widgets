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
    VoidCallback? onSuccess,
    VoidCallback? onError,
    String? submitText,
    String? cancelText,
    double? spaceBetween,
    String? errorMsg,
  }) =>
      BuzzFormWrapper(
        key: key,
        children: children,
        submitWidget: submitWidget,
        formKey: formKey,
        horizontalSpace: theme.horizontalSpace,
        verticalSpace: theme.verticalSpace,
        onSubmit: onSubmit,
        onCancel: onCancel,
        submitText: submitText,
        cancelText: cancelText,
        errorMsg: errorMsg,
      );
}
