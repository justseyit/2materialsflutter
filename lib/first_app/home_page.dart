import 'package:flutter/material.dart';

class FirstAppHomePage extends StatefulWidget {
  const FirstAppHomePage({Key? key}) : super(key: key);

  @override
  State<FirstAppHomePage> createState() => _FirstAppHomePageState();
}

class _FirstAppHomePageState extends State<FirstAppHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}