import 'package:buzz_result/models/result.dart';
import 'package:buzz_utils/buzz_utils.dart';
import 'package:flutter/material.dart';

import '../notifications/snackbar.dart';
import 'buzz_elevated_button.dart';
import 'buzz_text_button.dart';

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
    this.height,
    this.formKey,
    this.getErrors,
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

  final double? height;
  final GlobalKey<FormState>? formKey;
  final GetValueCallback<List<String>>? getErrors;

  @override
  Widget build(BuildContext context) {
    final submitWidget = BuzzElevatedButton(
      text: submitText ?? 'Submit',
      height: height,
      onPressed: onSubmit ??
          ((onResult ?? onResultAsync) == null
              ? null
              : () async {
                  final List<String> errors = getErrors == null ? [] : getErrors!();
                  final isValid = formKey == null || formKey?.currentState?.validate() == true;
                  // if invalid
                  if (!isValid || ListUtils.instance.isNotEmpty(errors)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      BuzzSnackBar(
                        msg: errors.isNotEmpty ? errors.first : 'An error has occurred.',
                        backgroundColor: errorColor,
                        textColor: onErrorColor,
                      ),
                    );
                    return;
                  }
                  Result syncResult = Result.success();
                  if (onResult != null) {
                    syncResult = onResult!();
                  }

                  Result asyncResult = Result.success();
                  if (onResultAsync != null) {
                    asyncResult = await onResultAsync!();
                  }

                  if (syncResult.hasFailed || asyncResult.hasFailed) {
                    final msg = syncResult.log?.msg ?? asyncResult.log?.msg;
                    ScaffoldMessenger.of(context).showSnackBar(
                      BuzzSnackBar(
                        msg: errorMsg ?? (msg ?? 'An error has occurred.'),
                        backgroundColor: errorColor,
                        textColor: onErrorColor,
                      ),
                    );
                    if (onError != null) {
                      onError!();
                    }
                  } else {
                    if (onSuccess != null) {
                      onSuccess!();
                    }
                  }
                }),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (onCancel != null) ...[
          Expanded(
            child: BuzzTextButton(
              text: cancelText ?? 'Cancel',
              onPressed: onCancel,
              height: height,
            ),
          ),
          SizedBox(width: spaceBetween ?? 16),
        ],
        Expanded(child: submitWidget),
      ],
    );
  }
}
