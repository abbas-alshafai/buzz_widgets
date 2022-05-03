import 'package:buzz_result/models/result.dart';
import 'package:buzz_utils/buzz_utils.dart';
import 'package:flutter/material.dart';

class BuzzSnackBarWrapper {
  late final BuildContext _context;

  BuzzSnackBarWrapper._(this._context);

  factory BuzzSnackBarWrapper.of(final BuildContext context) =>
      BuzzSnackBarWrapper._(context);

  @deprecated
  handle(
    final Result result,
      {
    final BuildContext? scaffoldContext,
    final String? errorMsg,
    final VoidCallback? onSuccess,
    final VoidCallback? onError,
    final Color? backgroundColor,
    final Color? onErrorColor,
    final bool isError = false,
  }) {
    if (result.isSuccessful) {
      if (onSuccess != null) {
        onSuccess();
      }

      return;
    }

    // result failed
    ScaffoldMessenger.of(_context).showSnackBar(
      BuzzSnackBar(
        msg: errorMsg ?? 'An error has occurred.',
        backgroundColor: backgroundColor,
        textColor: onErrorColor,
      ),
    );

    if (onError != null) {
      onError();
    }
  }

  show({
    final String? msg,
    final Color? backgroundColor,
    final Color? textColor,
  }) {
    ScaffoldMessenger.of(_context).showSnackBar(
      BuzzSnackBar(
        msg: msg,
        backgroundColor: backgroundColor,
        textColor: textColor,
      ),
    );
  }
}

class BuzzSnackBar extends SnackBar {
  BuzzSnackBar({
    final Key? key,
    final String? msg,
    final Color? backgroundColor,
    final Color? textColor,
  }) : super(
          key: key,
          content: Text(
            msg ?? '',
            style: const TextStyle().copyWith(color: textColor),
          ),
          backgroundColor: backgroundColor,
        );
}
