import 'package:buzz_result/models/result.dart';
import 'package:buzz_utils/buzz_utils.dart';
import 'package:flutter/material.dart';

import '../notifications/snackbar.dart';

class BuzzSubmitCancelButtons extends StatelessWidget {
  const BuzzSubmitCancelButtons({
    Key? key,
    this.onSubmit,
    this.onCancel,
    this.onSuccess,
    this.onError,
    this.submitText,
    this.cancelText,
    this.spaceBetween,
    this.onResult,
    this.onFutureResult,
    this.errorMsg,
    this.errorColor,
    this.onErrorColor,
  }) : super(key: key);

  final GetValueCallback<Result>? onResult;
  final GetValueCallback<Future<Result>>? onFutureResult;
  final VoidCallback? onSubmit;
  final VoidCallback? onCancel;
  final VoidCallback? onSuccess;
  final VoidCallback? onError;
  final String? submitText;
  final String? cancelText;
  final double? spaceBetween;

  final String? errorMsg;
  final Color? errorColor;
  final Color? onErrorColor;

  @override
  Widget build(BuildContext context) {

    final submitWidget = ElevatedButton(
      child: Text(submitText ?? 'Submit'),
      onPressed: onSubmit ??
          ((onResult ?? onFutureResult) == null
              ? null
              : () async {
                  if (onResult != null) {
                    final result = onResult!();
                    BuzzSnackBarWrapper.of(context).handle(
                      result,
                      onSuccess: onSuccess,
                      onError: onError,
                      errorMsg: errorMsg,
                      onErrorColor: onErrorColor,
                      backgroundColor: errorColor,
                      isError: result.hasFailed,
                    );
                  }

                  if (onFutureResult != null) {
                    final result = await onFutureResult!();
                    BuzzSnackBarWrapper.of(context).handle(
                      result,
                      onSuccess: onSuccess,
                      onError: onError,
                      errorMsg: errorMsg,
                      onErrorColor: onErrorColor,
                      backgroundColor: errorColor,
                      isError: result.hasFailed,
                    );
                  }
                }),
    );

    if(onCancel == null) {
      return submitWidget;
    }

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
        Expanded(child: submitWidget),
      ],
    );
  }
}
