import 'package:buzz_result/models/result.dart';
import 'package:buzz_utils/buzz_utils.dart';
import 'package:buzz_widgets/src/widgets/buttons/submit_cancel_buttons.dart';
import 'package:buzz_widgets/src/widgets/form/form.dart';
import 'package:flutter/material.dart';

import '../../utils/widget_utils.dart';

class BuzzFormWrapper extends StatelessWidget {
  const BuzzFormWrapper({
    Key? key,
    List<Widget>? children,
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
    this.goto,
    this.scaffoldContext,
  })  : children = children ?? const [],
        super(key: key);

  final BuildContext? scaffoldContext;
  final SetValueCallback<BuildContext>? goto;

  final List<Widget> children;
  final Widget? submitWidget;
  final Key? formKey;

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

  final GetValueCallback<Result>? onResult;
  final GetValueCallback<Future<Result>>? onRemoteResult;

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
            : BuzzSubmitCancelButtons(
                onResult: onResult,
                onFutureResult: onRemoteResult,
                onSubmit: onSubmit,
                onCancel: onCancel,
                onSuccess: onSuccess,
                submitText: submitText,
                cancelText: cancelText,
                spaceBetween: horizontalSpace,
                onErrorColor: onErrorColor,
                errorColor: errorColor,
              ));

    final form = BuzzForm(
      formKey: formKey,
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
