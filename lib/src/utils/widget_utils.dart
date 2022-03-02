import 'package:flutter/material.dart';

class BuzzWidgetUtils {
  static List<Widget> addSpaces({
    required final List<Widget>? children,
    final double? all,
    final double? vertical,
    final double? horizontal,
    final Widget? separator,
  }) {
    if (children == null) {
      return [];
    }

    final _vertical = all ?? vertical;
    final _horizontal = all ?? horizontal;

    final _separator = separator ?? SizedBox(
      height: _vertical ?? 0,
      width: _horizontal ?? 0,
    );

    final result = <Widget>[];

    for (int i = 0; i < children.length * 2 - 1; i++) {
      if (i.isEven) {
        result.add(children.elementAt(i ~/ 2));
      } else {
        result.add(_separator);
      }
    }

    return result;
  }
}
