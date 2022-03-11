import 'package:flutter/material.dart';

class BuzzTheme {
  final double? verticalSpace;
  final double? horizontalSpace;

  // colors
  final Color? error;
  final Color? onError;

  // padding
  final double scaffoldPadding;


  BuzzTheme({
    this.horizontalSpace = 16,
    this.verticalSpace = 8,
    this.scaffoldPadding = 8,
    this.error,
    this.onError,
  });
}
