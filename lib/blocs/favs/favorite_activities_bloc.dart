import 'package:candidateapp/repositories/bored_activity_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/bored_activity.dart';

part 'favorite_activities_event.dart';
part 'favorite_activities_state.dart';

class FavoriteActivitiesBloc extends Bloc<FavoriteActivitiesEvent, FavoriteActivitiesState> {
  FavoriteActivitiesBloc() : super(FavoriteActivitiesInitial()) {
    on<FavoriteActivitiesEvent>((event, emit) {});
    on<FetchFavoriteActivitiesEvent>((event, emit) async{
      try{
        emit(FetchingFavoriteActivitiesState());
        List<BoredActivity> activities = await BoredActivityRepository.instance.favs;
        emit(FetchedFavoriteActivitiesState(activities: activities));
      }
      catch(ex){
        emit(CantFetchFavoriteActivitiesState());
        rethrow;
      }
    });

    on<AddActivityToFavsEvent>((event, emit) async{
      try{
        await BoredActivityRepository.instance.addToFavs(activityID: event.activityID);
      }
      catch(ex){
        rethrow;
      }
    });

    on<RemoveActivityFromFavsEvent>((event, emit) async{
      try{
        await BoredActivityRepository.instance.removeFromFavs(activityID: event.activityID);
      }
      catch(ex){
        rethrow;
      }
    });
  }
}
