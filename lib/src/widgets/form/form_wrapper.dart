import 'package:buzz_result/models/result.dart';
import 'package:buzz_utils/buzz_utils.dart';
import 'package:buzz_widgets/src/widgets/buttons/submit_cancel_buttons.dart';
import 'package:buzz_widgets/src/widgets/form/form.dart';
import 'package:flutter/material.dart';

import '../../utils/widget_utils.dart';

class BuzzFormWrapper extends StatelessWidget {
  const BuzzFormWrapper({
    Key? key,
    final this.child,
    final this.children,
    this.submitWidget,
    this.formKey,
    this.onSubmit,
    this.onCancel,
    this.onSuccess,
    this.onError,
    this.submitText,
    this.cancelText,
    this.horizontalSpace,
    this.verticalSpace,
    this.errorMsg,
    this.errorColor,
    this.onErrorColor,
    this.onResult,
    this.onRemoteResult,
    this.submitWidgetPadding,
    this.submitWidgetHeight,
    this.scaffoldContext,
    this.getErrors,
    this.isLoading = false,
    this.loadingWidget,
  }) : super(key: key);

  final BuildContext? scaffoldContext;

  final bool isLoading;
  final Widget? loadingWidget;

  final Widget? child;
  final List<Widget>? children;
  final Widget? submitWidget;
  final GlobalKey<FormState>? formKey;

  final VoidCallback? onSuccess;
  final VoidCallback? onError;

  final String? errorMsg;
  final Color? errorColor;
  final Color? onErrorColor;

  final VoidCallback? onSubmit;
  final VoidCallback? onCancel;
  final String? submitText;
  final String? cancelText;
  final double? horizontalSpace;
  final double? verticalSpace;

  final double? submitWidgetPadding;
  final double? submitWidgetHeight;

  final GetValueCallback<Result>? onResult;
  final GetValueCallback<Future<Result>>? onRemoteResult;
  final GetValueCallback<List<String>>? getErrors;

  @override
  Widget build(BuildContext context) {
    final isEmptySubmit = onSubmit == null &&
        onCancel == null &&
        submitText == null &&
        cancelText == null &&
        horizontalSpace == null;

    final _submitWidget = submitWidget ??
        (isEmptySubmit
            ? null
            : isLoading
                ? loadingWidget
                : BuzzSubmitCancelButtons(
                    onResult: onResult,
                    onResultAsync: onRemoteResult,
                    onSubmit: onSubmit,
                    onCancel: onCancel,
                    onSuccess: onSuccess,
                    submitText: submitText,
                    cancelText: cancelText,
                    spaceBetween: horizontalSpace,
                    onErrorColor: onErrorColor,
                    errorColor: errorColor,
                    height: submitWidgetHeight,
                    getErrors: getErrors,
                    formKey: formKey,
                  ));

    final form = BuzzForm(
      formKey: formKey,
      child: child,
      children: BuzzWidgetUtils.addSpaces(
        vertical: verticalSpace,
        children: children,
      ),
    );

    return _submitWidget == null
        ? form
        : Column(
            children: [
              Expanded(child: form),
              submitWidgetPadding == null
                  ? _submitWidget
                  : Padding(
                      padding: EdgeInsets.all(submitWidgetPadding!),
                      child: _submitWidget,
                    ),
            ],
          );
  }
}
