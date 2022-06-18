import 'package:buzz_result/models/result.dart';
import 'package:buzz_utils/buzz_utils.dart';
import 'package:buzz_widgets/buzz_widgets.dart';
import 'package:flutter/material.dart';

class Buzz {
  final BuzzTheme theme;

  Buzz._(this.theme);

  factory Buzz.of(final BuzzTheme theme) => Buzz._(theme);

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
    final Widget? child,
    final List<Widget>? children = const [],
    final Widget? submitWidget,
    final double? submitWidgetHeight,
    final GlobalKey<FormState>? formKey,
    final VoidCallback? onSubmit,
    final VoidCallback? onCancel,
    final VoidCallback? onSuccess,
    final VoidCallback? onError,
    final String? submitText,
    final String? cancelText,
    final String? errorMsg,
    final GetValueCallback<Result>? onResult,
    final GetValueCallback<Future<Result>>? onRemoteResult,
    final BuildContext? scaffoldContext,
    final GetValueCallback<List<String>>? getErrors,
    final bool isLoading = false,
  }) =>
      BuzzFormWrapper(
        key: key,
        scaffoldContext: scaffoldContext,
        child: child,
        children: children,
        submitWidget: submitWidget,
        formKey: formKey,
        getErrors: getErrors,
        horizontalSpace: theme.horizontalSpace,
        verticalSpace: theme.verticalSpace,
        onSubmit: onSubmit,
        onCancel:onCancel,
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
        isLoading: isLoading,
        loadingWidget: theme.loadingWidget,
      );

  List<Widget> spacedChildren(
    final List<Widget> children, {
    final bool isHorizontal = false,
    final double? space,
  }) =>
      BuzzWidgetUtils.addSpaces(
        children: children,
        vertical: isHorizontal ? null : space ?? theme.verticalSpace,
        horizontal: isHorizontal ? space ?? theme.horizontalSpace : null,
      );
}
