import 'package:flutter/material.dart';

class ConfirmDialog extends StatelessWidget {
  final String title;
  final Widget content;
  final Function onCancelPressed;
  final Function onConfirmPressed;
  final Color cancelBtnColor;
  final Color confirmBtnColor;
  final String cancelBtnText;
  final String confirmBtnText;

  ConfirmDialog({
    this.title = 'Confirmation',
    @required this.content,
    this.onCancelPressed,
    @required this.onConfirmPressed,
    this.cancelBtnColor,
    this.confirmBtnColor,
    this.cancelBtnText = 'Cancel',
    this.confirmBtnText = 'Confirm',
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      title: Text(title),
      content: content,
      actions: <Widget>[
        FlatButton(
          textColor: cancelBtnColor != null
              ? cancelBtnColor
              : Theme.of(context).accentColor,
          child: Text(cancelBtnText),
          onPressed: () {
            Navigator.of(context).pop();
            if (onCancelPressed != null) {
              onCancelPressed();
            }
          },
        ),
        FlatButton(
          textColor: confirmBtnColor != null
              ? confirmBtnColor
              : Theme.of(context).primaryColor,
          child: Text(confirmBtnText),
          onPressed: () {
            Navigator.of(context).pop();
            if (onConfirmPressed != null) {
              onConfirmPressed();
            }
          },
        )
      ],
    );
  }
}
