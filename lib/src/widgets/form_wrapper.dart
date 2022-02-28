import 'package:flutter/material.dart';

/// Features:
/// 1- Dismiss mobile keyboard after typing in [TextFormField]s.
/// 2- Fix (submit) buttons at the bottom
/// 3- Expand form fields and make them scrollable.
class BuzzFormWrapper extends StatelessWidget {
  const BuzzFormWrapper({
    Key? key,
    List<Widget>? children,
    this.submitWidget,
    this.formKey,
  })  : children = children ?? const [],
        super(key: key);

  final List<Widget> children;
  final Widget? submitWidget;
  final Key? formKey;

  @override
  Widget build(BuildContext context) {
    final _form = GestureDetector(
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

    return submitWidget != null
        ? _form
        : Column(
            children: [
              Expanded(
                child: _form,
              ),
              submitWidget!,
            ],
          );
  }
}