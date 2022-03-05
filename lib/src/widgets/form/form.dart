import 'package:flutter/material.dart';

/// Features:
/// 1- Dismiss mobile keyboard after typing in [TextFormField]s.
/// 2- Fix (submit) buttons at the bottom
/// 3- Expand form fields and make them scrollable.
class BuzzForm extends StatelessWidget {
  const BuzzForm({
    Key? key,
    List<Widget>? children,
    this.formKey,
  }) : children = children ?? const [],
        super(key: key);

  final List<Widget> children;
  final Key? formKey;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Form(
        key: formKey,
        child: ListView(children: children),
      ),
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild?.unfocus();
        }
      },
    );
  }
}
