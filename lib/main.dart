import 'package:candidateapp/app_one/the_first_app.dart';
import 'package:candidateapp/app_two/the_second_app.dart';
import 'package:candidateapp/extensions/buildcontext_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
      ],
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainFrame(),
    );
  }
}

class MainFrame extends StatelessWidget {
  const MainFrame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.deviceScreenSize.width,
      height: context.deviceScreenSize.height,
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              width: context.deviceScreenSize.width/2,
              height: context.deviceScreenSize.height,
              child: TheFirstApp(),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              width: context.deviceScreenSize.width/2,
              height: context.deviceScreenSize.height,
              child: TheSecondApp(),
            ),
          ),
        ],
      ),
    );
  }
}