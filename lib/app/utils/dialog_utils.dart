import 'package:flutter/material.dart';

Future<T> showRoundedDialog<T>(
  BuildContext context,
  Widget page,
) async {
  final theme = Theme.of(context);
  final result = await showDialog<T>(
    context: context,
    barrierColor: Colors.black54,
    barrierDismissible: false,
    builder: (context) => Dialog(
      elevation: 0,
      backgroundColor: theme.canvasColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: page,
    ),
  );
  return result;
}
