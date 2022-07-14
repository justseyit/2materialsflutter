import 'package:candidateapp/models/filters/filter.dart';

import '../../models/bored_activity.dart';

///This is the class who other service classes will be implemented from it. Because using these methods is mandatory while the app's logic has created according these methods. Every new service class have to implement this abstract class.
abstract class BoredActivityBase {
  Future<List<BoredActivity>> get favs;
  Future<BoredActivity> getRandomActivityByFilter({required Filter filter});
  Future<BoredActivity> getActivityByID({required String activityID});
  Future<bool> addToFavs({required String activityID});
  Future<bool> removeFromFavs({required String activityID});
}
