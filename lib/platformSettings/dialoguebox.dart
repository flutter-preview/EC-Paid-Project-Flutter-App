import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PlatformAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onCancelPressed;
  final VoidCallback onConfirmPressed;

  const PlatformAlertDialog({
    required this.title,
    required this.content,
    required this.onCancelPressed,
    required this.onConfirmPressed,
  });

  @override
  Widget build(BuildContext context) {
      if (Theme.of(context).platform == TargetPlatform.iOS){
         return CupertinoAlertDialog(
            title: Text(title),
            content: Text(content),
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text('Cancel'),
                onPressed: onCancelPressed,
              ),
              CupertinoDialogAction(
                child: Text('Confirm'),
                onPressed: onConfirmPressed,
              ),
            ],
          );}

        else {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: <Widget>[
              TextButton(
                child: Text('Cancel'),
                onPressed: onCancelPressed,
              ),
              TextButton(
                child: Text('Confirm'),
                onPressed: onConfirmPressed,
              ),
            ],
          );}
  }
}
