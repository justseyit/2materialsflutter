import 'package:candidateapp/extensions/buildcontext_extension.dart';
import 'package:candidateapp/repositories/bored_activity_repository.dart';
import 'package:candidateapp/widgets/app_activity_display_box.dart';
import 'package:candidateapp/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/activity/bored_activity_bloc.dart';
import '../../models/bored_activity.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BoredActivityBloc boredActivityBloc = BlocProvider.of<BoredActivityBloc>(context);
    boredActivityBloc.add(FetchBoredActivityEvent(filter: BoredActivityRepository.instance.currentFilter));
    return BlocBuilder<BoredActivityBloc, BoredActivityState>(
      bloc: boredActivityBloc,
      builder: (context, state) {
        if(state is FetchingBoredActivityState){
          return fetchingBoredActivityFragmet;
        }else if(state is CantFetchBoredActivityState){
          return cantFetchBoredActivityFragment(context, boredActivityBloc);
        }else if(state is FetchedBoredActivityState){
          return fetchedBoredActivityFragment(context, state.activity, boredActivityBloc);
        }
        return const SizedBox(
          child: Text('Another state'),
        );
      },
    );
  }


  Widget get fetchingBoredActivityFragmet => const Center(
    child: CircularProgressIndicator(),
  );
  Widget cantFetchBoredActivityFragment(BuildContext context, BoredActivityBloc boredActivityBloc) => Center(
    child: SizedBox(
      width: context.deviceScreenSize.width*.9,
      height: context.deviceScreenSize.width*.9,
      child: Column(
        children: [
          Text("Can't fetch the activities."),
          CaButton(
            child: Text('Retry'),
            onTap: () => boredActivityBloc.add(FetchBoredActivityEvent(filter: BoredActivityRepository.instance.currentFilter)),
          )
        ],
      ),
    ),
  );
  Widget fetchedBoredActivityFragment(BuildContext context, BoredActivity activity, BoredActivityBloc boredActivityBloc){
    return Center(
      child: SingleChildScrollView(
        child: SizedBox(
          width: context.deviceScreenSize.width*.9,
          height: context.deviceScreenSize.width*.5,
          child: Column(
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
                  child: Center(child: Text('Fetch Again')),
                ),
              ),
              CaActivityDisplayBox(
                activity: activity,
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget fetchedFavActivitiesFragment(BuildContext context, List<BoredActivity> activities){
    List<Widget> children = [];
    for(BoredActivity activity in activities){
      children.add(CaActivityDisplayBox(activity: activity));
    }
    return Center(
      child: SingleChildScrollView(
        child: SizedBox(
          width: context.deviceScreenSize.width*.9,
          height: context.deviceScreenSize.height*.9,
          child: Column(
            children: children,
          ),
        ),
      ),
    );
  }
}
