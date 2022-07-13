import 'package:flutter/material.dart';

class CaButton extends StatelessWidget {
  const CaButton({Key? key, required this.onTap, required this.child, this.borderRadius}) : super(key: key);

  final VoidCallback onTap;
  final Widget child;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: borderRadius,
      child: child,
    );
  }
}
