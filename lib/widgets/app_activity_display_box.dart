import 'package:candidateapp/extensions/buildcontext_extension.dart';
import 'package:candidateapp/models/bored_activity.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class CaActivityDisplayBox extends StatelessWidget {
  const CaActivityDisplayBox({Key? key, required this.activity}) : super(key: key);
  final BoredActivity activity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: context.deviceScreenSize.width*.5,
        height: context.deviceScreenSize.width*.5,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('${AppLocalizations.of(context)!.activity}: ${activity.activity}'),
            Text('${AppLocalizations.of(context)!.accessibility}: ${activity.accessibility}'),
            Text('${AppLocalizations.of(context)!.type}: ${activity.type}'),
            Text('${AppLocalizations.of(context)!.participants}: ${activity.participants.toString()}'),
            Text('${AppLocalizations.of(context)!.price}: ${activity.price.toString()}'),
            Text('${AppLocalizations.of(context)!.link}: ${activity.link}'),
            Text('${AppLocalizations.of(context)!.key}: ${activity.key}'),
          ],
        ),
      ),
    );
  }
}
