import 'package:candidateapp/models/filters/filter.dart';

import '../../models/bored_activity.dart';

abstract class BoredActivityBase {
  List<BoredActivity> favs = [];

  Future<BoredActivity> getRandomActivityByFilter({required Filter filter});
  Future<BoredActivity> getActivityByID({required String activityID});
  Future<bool> addToFavs({required String activityID});
  Future<bool> removeFromFavs({required String activityID});
}
