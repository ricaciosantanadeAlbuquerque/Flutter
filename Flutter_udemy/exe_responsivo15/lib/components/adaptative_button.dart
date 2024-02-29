import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeButton extends StatelessWidget {
  final String label;
  final Function() onPressed;

  const AdaptativeButton({super.key, required this.label, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? 
      CupertinoButton(
        onPressed: onPressed,
        color:Theme.of(context).colorScheme.primary, 
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(label)
      ) 
    : ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:Theme.of(context).colorScheme.primary
      ),
      onPressed: onPressed, child: Text(label),
    );
  }
}
