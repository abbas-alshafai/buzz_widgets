import 'package:flutter/material.dart';

extension StringUI on String{
  Color? toColor(){
    final value = int.tryParse(this);
    return value == null ? null : Color(value);
  }
}