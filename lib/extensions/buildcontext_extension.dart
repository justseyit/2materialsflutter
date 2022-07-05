import 'package:flutter/material.dart';

extension AppBuildContextExtension on BuildContext{

  Size get deviceScreenSize => MediaQuery.of(this).size;
}