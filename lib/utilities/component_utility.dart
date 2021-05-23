import 'package:flutter/material.dart';

class ComponentUtility {

  ComponentUtility._();

  static Widget button(BuildContext context, String text, {
    Widget? page,
    Function? onPressed,
  }) {
    return TextButton(
      onPressed: () {
        if (page != null) {
          Navigator.push(context, MaterialPageRoute(builder: (_) => page));
        }
        if (onPressed != null) {
          onPressed();
        }
      },
      child: Text(text),
    );
  }

}