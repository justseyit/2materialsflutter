import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SecondAppHomePage extends StatefulWidget {
  const SecondAppHomePage({Key? key}) : super(key: key);

  @override
  State<SecondAppHomePage> createState() => _SecondAppHomePageState();
}

class _SecondAppHomePageState extends State<SecondAppHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildBody(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(AppLocalizations.of(context)?.theSecondApp ?? 'The Second App'),
    );
  }

  Center buildBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Text(
            'You have pushed the button this many times:',
          ),
        ],
      ),
    );
  }
}