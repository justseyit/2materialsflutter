import 'package:flutter/material.dart';

class SecondAppHomePage extends StatefulWidget {
  const SecondAppHomePage({Key? key}) : super(key: key);

  @override
  State<SecondAppHomePage> createState() => _SecondAppHomePageState();
}

class _SecondAppHomePageState extends State<SecondAppHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
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