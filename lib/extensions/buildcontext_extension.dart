import 'package:flutter/material.dart';

//An extension on BuildContext class.
extension AppBuildContextExtension on BuildContext{

  //A getter to get device screen size.
  Size get deviceScreenSize => MediaQuery.of(this).size;
}