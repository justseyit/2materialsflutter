import 'package:candidateapp/second_app/home_page.dart';
import 'package:flutter/material.dart';

class TheSecondApp extends StatelessWidget {
  const TheSecondApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SecondAppHomePage(),
    );
  }
}
