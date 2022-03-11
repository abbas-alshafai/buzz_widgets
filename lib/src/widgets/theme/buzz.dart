import 'package:buzz_result/models/result.dart';
import 'package:buzz_utils/buzz_utils.dart';
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
    final Key? key,
    final List<Widget>? children = const [],
    final Widget? submitWidget,
    final Key? formKey,
    final VoidCallback? onSubmit,
    final VoidCallback? onCancel,
    final VoidCallback? onSuccess,
    final VoidCallback? onError,
    final String? submitText,
    final String? cancelText,
    final double? spaceBetween,
    final String? errorMsg,
    final GetValueCallback<Result>? onResult,
    final GetValueCallback<Future<Result>>? onRemoteResult,
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
        onSuccess: onSuccess,
        onError: onError,
        submitText: submitText,
        cancelText: cancelText,
        errorMsg: errorMsg,
        onResult: onResult,
        onRemoteResult: onRemoteResult,
      );
}
