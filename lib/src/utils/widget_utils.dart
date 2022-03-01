import 'package:flutter/material.dart';

class BuzzWidgetUtils {
  static List<Widget> addSpaces({
    required final List<Widget>? children,
    final double? all,
    final double? vertical,
    final double? horizontal,
  }) {
    if(children == null) {
      return [];
    }

    return children
            .map(
              (e) => Padding(
                padding: all != null
                    ? EdgeInsets.all(all)
                    : EdgeInsets.symmetric(
                        vertical: vertical ?? 0,
                        horizontal: horizontal ?? 0,
                      ),
                child: e,
              ),
            )
            .toList();
  }
}
