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
    this.onRemoteResult,
    this.errorMsg,
    this.errorColor,
    this.onErrorColor,
  }) : super(key: key);

  final GetValueCallback<Result>? onResult;
  final GetValueCallback<Future<Result>>? onRemoteResult;
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
            onPressed: onSubmit ??
                ((onResult ?? onRemoteResult) == null
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
                            errorColor: errorColor,
                            isError: result.hasFailed,
                          );
                        } else {
                          final result = await onRemoteResult!();
                          BuzzSnackBarWrapper.of(context).handle(
                            result,
                            onSuccess: onSuccess,
                            onError: onError,
                            errorMsg: errorMsg,
                            onErrorColor: onErrorColor,
                            errorColor: errorColor,
                            isError: result.hasFailed,
                          );
                        }
                      }),
          ),
        ),
      ],
    );
  }
}
