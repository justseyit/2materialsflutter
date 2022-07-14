import 'package:candidateapp/extensions/buildcontext_extension.dart';
import 'package:candidateapp/models/bored_activity.dart';
import 'package:candidateapp/repositories/bored_activity_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../widgets/app_activity_display_box.dart';

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
      title: Text(AppLocalizations.of(context)!.theSecondApp),
    );
  }

  Center buildBody() {
    return Center(
      child: SizedBox(
        width: context.deviceScreenSize.width,
        height: context.deviceScreenSize.height,
        child: StreamBuilder(
          stream: BoredActivityRepository.instance.getFavAvtivitiesStream(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              return fetchedFavActivitiesFragment(context, snapshot.data as List<BoredActivity>);
            }
            return fetchingBoredActivitiesFragmet;
          },
        ),
      ),
    );
  }

  Widget fetchedFavActivitiesFragment(BuildContext context, List<BoredActivity> activities) {
    List<Widget> children = [];
    for (BoredActivity activity in activities) {
      children.add(Padding(
        padding: const EdgeInsets.only(top: 4.0, left: 4.0, right: 4.0, bottom: 10.0),
        child: Column(
          children: [
            CaActivityDisplayBox(activity: activity),
          ],
        ),
      ));
    }
    return Center(
      child: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            children: children,
          ),
        ),
      ),
    );
  }

  Widget get fetchingBoredActivitiesFragmet => const Center(child: CircularProgressIndicator());
}