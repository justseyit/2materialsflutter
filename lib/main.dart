import 'package:candidateapp/blocs/activity/bored_activity_bloc.dart';
import 'package:candidateapp/blocs/favs/favorite_activities_bloc.dart';
import 'package:candidateapp/first_app/material_app.dart';
import 'package:candidateapp/second_app/material_app.dart';
import 'package:candidateapp/extensions/buildcontext_extension.dart';
import 'package:candidateapp/utils/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefsUtil.init();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  GlobalKey key = GlobalKey();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BoredActivityBloc>(create: (_) => BoredActivityBloc()),
        BlocProvider<FavoriteActivitiesBloc>(create: (_) => FavoriteActivitiesBloc()),
      ],
      child: const MaterialApp(
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: false,
        title: 'Candidate App',
        home: MainFrame(),
      ),
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
            child: SizedBox(
              width: context.deviceScreenSize.width / 2,
              height: context.deviceScreenSize.height,
              child: const TheFirstApp(),
            ),
          ),
          Flexible(
            flex: 1,
            child: SizedBox(
              width: context.deviceScreenSize.width / 2,
              height: context.deviceScreenSize.height,
              child: const TheSecondApp(),
            ),
          ),
        ],
      ),
    );
  }
}