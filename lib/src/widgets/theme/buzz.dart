import 'package:buzz_result/models/result.dart';
import 'package:buzz_utils/buzz_utils.dart';
import 'package:buzz_widgets/buzz_widgets.dart';
import 'package:flutter/material.dart';

class Buzz {
  final BuzzTheme theme;
  final BuzzActions? actions;

  Buzz._(this.theme, {this.actions});

  factory Buzz.of(
    final BuzzTheme theme, {
    final BuzzActions? actions,
  }) =>
      Buzz._(theme, actions: actions);

  showSnackbar(final BuildContext context, final String msg) =>
      BuzzSnackBarWrapper.of(context).show(msg: msg);

  showErrorSnackbar(final BuildContext context, final String msg) =>
      BuzzSnackBarWrapper.of(context).show(
        msg: msg,
        backgroundColor: theme.error,
        textColor: theme.onError,
      );

  Widget formWrapper({
    final Key? key,
    final List<Widget>? children = const [],
    final Widget? submitWidget,
    final double? submitWidgetHeight,
    final Key? formKey,
    final VoidCallback? onSubmit,
    final VoidCallback? onCancel,
    final VoidCallback? onSuccess,
    final VoidCallback? onError,
    final String? submitText,
    final String? cancelText,
    final String? errorMsg,
    final GetValueCallback<Result>? onResult,
    final GetValueCallback<Future<Result>>? onRemoteResult,
    final SetValueCallback<BuildContext>? goto,
    final BuildContext? scaffoldContext,
  }) =>
      BuzzFormWrapper(
        key: key,
        scaffoldContext: scaffoldContext,
        children: children,
        goto: goto,
        submitWidget: submitWidget,
        formKey: formKey,
        horizontalSpace: theme.horizontalSpace,
        verticalSpace: theme.verticalSpace,
        onSubmit: onSubmit,
        onCancel: actions?.defaultActions == true
            ? onCancel ?? actions?.onCancel
            : onCancel,
        onSuccess: onSuccess,
        onError: onError,
        submitText: submitText,
        cancelText: cancelText,
        errorMsg: errorMsg,
        onResult: onResult,
        onRemoteResult: onRemoteResult,
        errorColor: theme.error,
        onErrorColor: theme.onError,
        submitWidgetPadding: theme.scaffoldPadding,
        submitWidgetHeight: submitWidgetHeight ?? theme.mainButtonHeight,
      );
}
