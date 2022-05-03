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
    this.onResultAsync,
    this.errorMsg,
    this.errorColor,
    this.onErrorColor,
  }) : super(key: key);

  final GetValueCallback<Result>? onResult;
  final GetValueCallback<Future<Result>>? onResultAsync;
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
          ((onResult ?? onResultAsync) == null
              ? null
              : () async {
                  Result syncResult = Result.success();
                  if (onResult != null) {
                    syncResult = onResult!();
                  }

                  Result asyncResult = Result.success();
                  if (onResultAsync != null) {
                    asyncResult = await onResultAsync!();
                  }

                  if(syncResult.hasFailed || asyncResult.hasFailed){
                    ScaffoldMessenger.of(context).showSnackBar(
                      BuzzSnackBar(
                        msg: errorMsg ?? 'An error has occurred.',
                        backgroundColor: errorColor,
                        textColor: onErrorColor,
                      ),
                    );
                  }

                  if (onError != null) {
                    onError!();
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
