import 'package:candidateapp/models/filters/filter.dart';

import '../../models/bored_activity.dart';

abstract class BoredActivityBase {
  Future<List<BoredActivity>> get favs;
  Future<BoredActivity> getRandomActivityByFilter({required Filter filter});
  Future<BoredActivity> getActivityByID({required String activityID});
  Future<bool> addToFavs({required String activityID});
  Future<bool> removeFromFavs({required String activityID});
  //Stream<List<BoredActivity>> listenFavoriteActivityList();
}
