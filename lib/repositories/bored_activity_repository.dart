import 'package:candidateapp/models/filters/activity_no_filter.dart';
import 'package:candidateapp/services/live/bored_activity.dart';
import 'package:candidateapp/services/mock/bored_activity.dart';

import '../models/bored_activity.dart';
import '../models/filters/filter.dart';


///An enum to manage and debug the source. Different values can be added with defining their service classes. (Ex.: Firebase, MongoDB, ...)
enum BoredActivityBackendSource { mock, live }

///This is the repository of Bored API activity fetch operations.
class BoredActivityRepository {

  //#region Singleton Definition
  static BoredActivityRepository? _instance;

  static BoredActivityRepository get instance {
    _instance ??= BoredActivityRepository._internal();
    return _instance!;
  }

  BoredActivityRepository._internal();
  //#endregion

  ///The backend source can be managed by this value.
  final BoredActivityBackendSource boredActivityBackendSource = BoredActivityBackendSource.live;

  //Instances of mock and live service singleton classes.
  final MockBoredActivityService _mockBoredActivityService = MockBoredActivityService.instance;
  final LiveBoredActivityService _liveBoredActivityService = LiveBoredActivityService.instance;

  Filter currentFilter = ActivityNoFilter();

  ///The method to get activities by filter. If there is no filter, ActivityNoFilter class will be used.
  Future<BoredActivity> getRandomActivityByFilter({required Filter filter}) async{
    switch(boredActivityBackendSource){
      case BoredActivityBackendSource.mock:
        return _mockBoredActivityService.getRandomActivityByFilter(filter: filter);

      case BoredActivityBackendSource.live:
        return _liveBoredActivityService.getRandomActivityByFilter(filter: filter);
    }
  }

  ///The method to get activities by activity ID ([key]).
  Future<BoredActivity> getRandomActivityByID({required String activityID}){
    switch(boredActivityBackendSource){
      case BoredActivityBackendSource.mock:
        return _mockBoredActivityService.getActivityByID(activityID: activityID);

      case BoredActivityBackendSource.live:
        return _liveBoredActivityService.getActivityByID(activityID: activityID);
    }
  }

  ///The method to add an activity to favorite activities.
  Future<bool> addToFavs({required String activityID}){
    switch(boredActivityBackendSource){
      case BoredActivityBackendSource.mock:
        return _mockBoredActivityService.addToFavs(activityID: activityID);

      case BoredActivityBackendSource.live:
        return _liveBoredActivityService.addToFavs(activityID: activityID);
    }
  }

  ///The method to add an activity from favorite activities.
  Future<bool> removeFromFavs({required String activityID}){
    switch(boredActivityBackendSource){
      case BoredActivityBackendSource.mock:
        return _mockBoredActivityService.removeFromFavs(activityID: activityID);

      case BoredActivityBackendSource.live:
        return _liveBoredActivityService.removeFromFavs(activityID: activityID);
    }
  }

  ///The getter to get favorite activities.
  Future<List<BoredActivity>> get favs{
    switch(boredActivityBackendSource){
      case BoredActivityBackendSource.mock:
        return _mockBoredActivityService.favs;

      case BoredActivityBackendSource.live:
        return _liveBoredActivityService.favs;
    }
  }
}
