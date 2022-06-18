import 'package:flutter/material.dart';

/// Features:
/// 1- Dismiss mobile keyboard after typing in [TextFormField]s.
/// 2- Fix (submit) buttons at the bottom
/// 3- Expand form fields and make them scrollable.
class BuzzForm extends StatelessWidget {
  const BuzzForm({
    final Key? key,
    final this.child,
    final this.children,
    this.formKey,
  }) : super(key: key);

  final Widget? child;
  final List<Widget>? children;
  final Key? formKey;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Form(
        key: formKey,
        child: child ?? ListView(children: children ?? []),
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
