//
// import 'package:flutter/material.dart';
//
// class BuzzSnackBar{
//   late final BuildContext _context;
//
//   BuzzSnackBar._(this._context);
//
//   factory BuzzSnackBar.of(final BuildContext context) =>
//       BuzzSnackBar._(context);
//
//   handle(
//       final Result result, {
//         final Reader? read,
//         final String? errorMsg,
//         final VoidCallback? onSuccess,
//         final VoidCallback? onError,
//       }) {
//     if (result.hasFailed) {
//       ScaffoldMessenger.of(_context).showSnackBar(
//         XSnackBar(read: read, msg: errorMsg ?? 'An error has occurred.'),
//       );
//       if (onError != null) {
//         onError();
//       }
//     } else {
//       if (onSuccess != null) {
//         onSuccess();
//       } else
//         AppNavigator.pop(_context);
//     }
//   }
// }
//
// class XSnackBar extends SnackBar {
//   XSnackBar({
//     Key? key,
//     Reader? read,
//     String? msg,
//     bool isError = true,
//   }) : super(
//     content: Text(
//       msg ?? '',
//       style: TextStyle().copyWith(
//         color: isError && read != null
//             ? read(themeProvider).themeData.colorScheme.onError
//             : null,
//       ),
//     ),
//     backgroundColor: isError
//         ? ThemeFactory.instance.getTheme().themeData.colorScheme.error
//         : null,
//   );
// }