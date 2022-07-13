import 'package:flutter/material.dart';

class CaRadio<T> extends StatefulWidget {
  const CaRadio({Key? key, required this.title, required this.value, required this.groupValue, required this.onChanged}) : super(key: key);
  final Widget title;
  final T value;
  final T? groupValue;
  final void Function(T?)? onChanged;

  @override
  State<CaRadio> createState() => _CaRadioState<T>();
}

class _CaRadioState<T> extends State<CaRadio> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: widget.title,
      leading: Radio<T>(
        value: widget.value,
        groupValue: widget.groupValue,
        onChanged: widget.onChanged,
      ),
    );
  }
}
