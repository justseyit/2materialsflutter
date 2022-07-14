import 'package:candidateapp/extensions/buildcontext_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../blocs/favs/favorite_activities_bloc.dart';
import '../../models/bored_activity.dart';
import '../../widgets/app_activity_display_box.dart';
import '../../widgets/app_button.dart';

class FavsTab extends StatelessWidget {
  const FavsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FavoriteActivitiesBloc favoriteActivitiesBloc =
        BlocProvider.of<FavoriteActivitiesBloc>(context);
    favoriteActivitiesBloc.add(FetchFavoriteActivitiesEvent());
    return BlocBuilder<FavoriteActivitiesBloc, FavoriteActivitiesState>(
      builder: (context, state) {
        if (state is FetchingFavoriteActivitiesState) {
          return fetchingBoredActivityFragmet;
        } else if (state is CantFetchFavoriteActivitiesState) {
          return cantFetchFavoriteActivitiesFragment(
              context, favoriteActivitiesBloc);
        } else if (state is FetchedFavoriteActivitiesState) {
          return fetchedFavActivitiesFragment(
              context, state.activities, favoriteActivitiesBloc);
        }

        return Container();
      },
    );
  }

  Widget fetchedFavActivitiesFragment(BuildContext context, List<BoredActivity> activities, FavoriteActivitiesBloc favoriteActivitiesBloc) {
    List<Widget> children = [];
    for (BoredActivity activity in activities) {
      children.add(Padding(
        padding: const EdgeInsets.only(top: 4.0, left: 4.0, right: 4.0, bottom: 10.0),
        child: Column(
          children: [
            CaActivityDisplayBox(activity: activity),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CaButton(
                  onTap: () {
                    favoriteActivitiesBloc.add(RemoveActivityFromFavsEvent(activityID: activity.key));
                    favoriteActivitiesBloc.add(FetchFavoriteActivitiesEvent());
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context)!.removedFromFavorites)));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10)),
                    width: context.deviceScreenSize.width * .25,
                    height: context.deviceScreenSize.width * .05,
                    child: Center(child: Text(AppLocalizations.of(context)!.removeFromFavorites)),
                  ),
                ),
              ],
            )
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

  Widget get fetchingBoredActivityFragmet => const Center(child: CircularProgressIndicator());

  Widget cantFetchFavoriteActivitiesFragment(BuildContext context, FavoriteActivitiesBloc favoriteActivitiesBloc) => Center(
        child: SizedBox(
          width: context.deviceScreenSize.width * .9,
          height: context.deviceScreenSize.width * .9,
          child: Column(
            children: [
              Text(AppLocalizations.of(context)!.cantFetchTheActivities),
              CaButton(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  width: context.deviceScreenSize.width * .25,
                  height: context.deviceScreenSize.width * .05,
                  child: Center(child: Text(AppLocalizations.of(context)!.retry))),
                onTap: () =>
                    favoriteActivitiesBloc.add(FetchFavoriteActivitiesEvent()),
              )
            ],
          ),
        ),
      );
}
