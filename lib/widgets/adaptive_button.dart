import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveButton extends StatelessWidget {
  final String buttonText;
  final Function handler;

  const AdaptiveButton(
    this.buttonText,
    this.handler,
  );

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            onPressed: handler,
            child: Text(
              buttonText,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        : FlatButton(
            textColor: Theme.of(context).primaryColor,
            onPressed: handler,
            child: Text(
              buttonText,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          );
  }
}
