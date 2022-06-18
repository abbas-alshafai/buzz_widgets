import 'package:flutter/material.dart';

class BuzzTheme {

  final double? verticalSpace;
  final double? horizontalSpace;

  // colors
  final Color? error;
  final Color? onError;

  // padding
  final double scaffoldPadding;

  // buttons
  final double mainButtonHeight;

  // widgets
  final Widget loadingWidget;

  BuzzTheme({
    final this.horizontalSpace = 16,
    final this.verticalSpace = 8,
    final this.scaffoldPadding = 8,
    final this.mainButtonHeight = 48,
    final this.error,
    final this.onError,
    final Widget? loadingWidget,
  }) : loadingWidget = loadingWidget ?? const CircularProgressIndicator();
}

class X extends StatelessWidget {
  const X({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
