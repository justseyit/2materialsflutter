import 'package:candidateapp/first_app/home_page.dart';
import 'package:flutter/material.dart';

class TheFirstApp extends StatelessWidget {
  const TheFirstApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FirstAppHomePage(),
    );
  }
}
