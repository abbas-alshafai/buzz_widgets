import 'package:buzz_widgets/buzz_widgets.dart';
import 'package:buzz_widgets/src/widgets/buttons/buzz_submit_cancel_buttons.dart';
import 'package:buzz_widgets/src/widgets/theme/buzz_theme.dart';
import 'package:flutter/material.dart';

class Buzz{
  final BuzzTheme theme;
  Buzz._(this.theme);

  factory Buzz.of(final BuzzTheme theme) => Buzz._(theme);

  Widget formWrapper(
  VoidCallback? onSubmit,
  VoidCallback? onCancel,
  String? submitText,
  String? cancelText,
  double? spaceBetween,
  ) => SubmitCancelButtons(spaceBetween: theme.hSpace,);
}