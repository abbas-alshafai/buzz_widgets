import 'package:buzz_result/models/result.dart';
import 'package:flutter/material.dart';

class BuzzSnackBarWrapper {
  late final BuildContext _context;

  BuzzSnackBarWrapper._(this._context);

  factory BuzzSnackBarWrapper.of(final BuildContext context) =>
      BuzzSnackBarWrapper._(context);

  handle(
    final Result result, {
    final String? errorMsg,
    final VoidCallback? onSuccess,
    final VoidCallback? onError,
    final Color? errorColor,
    final Color? onErrorColor,
    final bool isError = false,
  }) {
    if (result.hasFailed) {
      ScaffoldMessenger.of(_context).showSnackBar(
        BuzzSnackBar(
          msg: errorMsg ?? 'An error has occurred.',
          errorColor: errorColor,
          onErrorColor: onErrorColor,
          isError: isError,
        ),
      );
      if (onError != null) {
        onError();
      }
    } else {
      if (onSuccess != null) {
        onSuccess();
      }
    }
  }
}

class BuzzSnackBar extends SnackBar {
  BuzzSnackBar({
    final Key? key,
    final String? msg,
    final bool isError = true,
    final Color? errorColor,
    final Color? onErrorColor,
  }) : super(
          key: key,
          content: Text(
            msg ?? '',
            style: const TextStyle().copyWith(
              color: isError ? onErrorColor : null,
            ),
          ),
          backgroundColor: isError ? errorColor : null,
        );
}
