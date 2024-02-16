import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptativeButton extends StatelessWidget {
  final String label;
  final void Function() onPressed;

  const AdaptativeButton({super.key, required this.label, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(color: Theme.of(context).colorScheme.primary, onPressed: onPressed, child: Text(label))
        : ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
            onPressed: onPressed,
            child: Text(label),
          );
  }
}
