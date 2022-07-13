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

  //Backend source management
  final BoredActivityBackendSource boredActivityBackendSource = BoredActivityBackendSource.mock;

  //Instances of mock and live service singleton classes.
  final MockBoredActivityService _mockBoredActivityService = MockBoredActivityService.instance;
  final LiveBoredActivityService _liveBoredActivityService = LiveBoredActivityService.instance;


  ///The method to get activities by filter. If no filter, ActivityNoFilter class will be used. The source can be managed from [boredActivityBackendSource] value.
  Future<BoredActivity> getRandomActivityByFilter({required Filter filter}) async{
    switch(boredActivityBackendSource){
      case BoredActivityBackendSource.mock:
        return _mockBoredActivityService.getRandomActivityByFilter(filter: filter);

      case BoredActivityBackendSource.live:
        return _liveBoredActivityService.getRandomActivityByFilter(filter: filter);
    }
  }
}
