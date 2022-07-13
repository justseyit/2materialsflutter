import 'package:flutter/material.dart';

class CaAlertDialog extends StatefulWidget {
  const CaAlertDialog({Key? key, required this.title, required this.content}) : super(key: key);
  final Widget title;
  final Widget content;

  @override
  State<CaAlertDialog> createState() => _CaAlertDialogState();
}

class _CaAlertDialogState extends State<CaAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: widget.title,
      content: widget.content,
    );
  }
}
