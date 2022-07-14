import 'package:candidateapp/blocs/favs/favorite_activities_bloc.dart';
import 'package:candidateapp/extensions/buildcontext_extension.dart';
import 'package:candidateapp/repositories/bored_activity_repository.dart';
import 'package:candidateapp/widgets/app_activity_display_box.dart';
import 'package:candidateapp/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../blocs/activity/bored_activity_bloc.dart';
import '../../models/bored_activity.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BoredActivityBloc boredActivityBloc = BlocProvider.of<BoredActivityBloc>(context);
    FavoriteActivitiesBloc favoriteActivitiesBloc = BlocProvider.of<FavoriteActivitiesBloc>(context);
    boredActivityBloc.add(FetchBoredActivityEvent(filter: BoredActivityRepository.instance.currentFilter));
    return BlocBuilder<BoredActivityBloc, BoredActivityState>(
      bloc: boredActivityBloc,
      builder: (context, state) {
        if(state is FetchingBoredActivityState){
          return fetchingBoredActivityFragmet;
        }else if(state is CantFetchBoredActivityState){
          return cantFetchBoredActivityFragment(context, boredActivityBloc);
        }else if(state is FetchedBoredActivityState){
          return fetchedBoredActivityFragment(context, state.activity, boredActivityBloc, favoriteActivitiesBloc);
        }
        return const SizedBox();
      },
    );
  }


  Widget get fetchingBoredActivityFragmet => const Center(child: CircularProgressIndicator());
  Widget cantFetchBoredActivityFragment(BuildContext context, BoredActivityBloc boredActivityBloc) => Center(
    child: SizedBox(
      width: context.deviceScreenSize.width*.9,
      height: context.deviceScreenSize.width*.9,
      child: Column(
        children: [
          Text(AppLocalizations.of(context)!.cantFetchTheActivities),
          CaButton(
            child: Text(AppLocalizations.of(context)!.retry),
            onTap: () => boredActivityBloc.add(FetchBoredActivityEvent(filter: BoredActivityRepository.instance.currentFilter)),
          )
        ],
      ),
    ),
  );
  Widget fetchedBoredActivityFragment(BuildContext context, BoredActivity activity, BoredActivityBloc boredActivityBloc, FavoriteActivitiesBloc favoriteActivitiesBloc){
    return Center(
      child: SizedBox(
        width: context.deviceScreenSize.width,
        height: context.deviceScreenSize.height,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CaButton(
                    onTap: ()=>boredActivityBloc.add(FetchBoredActivityEvent(filter: BoredActivityRepository.instance.currentFilter)),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      width: context.deviceScreenSize.width*.15,
                      height: context.deviceScreenSize.width*.05,
                      child: Center(child: Text(AppLocalizations.of(context)!.fetchAgain)),
                    ),
                  ),
                  CaButton(
                    onTap: (){
                      favoriteActivitiesBloc.add(AddActivityToFavsEvent(activityID: activity.key));
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context)!.addedToFavorites)));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      width: context.deviceScreenSize.width*.15,
                      height: context.deviceScreenSize.width*.05,
                      child: Center(child: Text(AppLocalizations.of(context)!.makeFavorite)),
                    ),
                  ),
                ],
              ),
            ),
            CaActivityDisplayBox(
              activity: activity,
            ),
          ],
        ),
      ),
    );
  }
}
