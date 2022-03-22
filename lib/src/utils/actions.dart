import 'package:flutter/material.dart';

class BuzzActions{
  final bool defaultActions;
  final VoidCallback? onCancel;

  BuzzActions({this.onCancel, this.defaultActions = false,});
}