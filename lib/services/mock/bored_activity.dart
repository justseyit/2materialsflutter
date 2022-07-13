import 'package:candidateapp/models/bored_activity.dart';
import 'package:candidateapp/models/filters/filter.dart';
import 'package:candidateapp/services/base/bored_activity.dart';

class MockBoredActivityService implements BoredActivityBase {
  static MockBoredActivityService? _instance;

  static MockBoredActivityService get instance {
    _instance ??= MockBoredActivityService._internal();
    return _instance!;
  }

  MockBoredActivityService._internal();

  @override
  Future<BoredActivity> getRandomActivityByFilter({required Filter filter}) {
    // TODO: implement getRandomActivityByFilter
    throw UnimplementedError();
  }

  @override
  Future<bool> addToFavs({required String activityID}) {
    // TODO: implement addToFavs
    throw UnimplementedError();
  }

  @override
  Future<bool> removeFromFavs({required String activityID}) {
    // TODO: implement removeFromFavs
    throw UnimplementedError();
  }

  @override
  List<BoredActivity> favs = [];

  @override
  Future<BoredActivity> getActivityByID({required String activityID}) {
    // TODO: implement getActivityByID
    throw UnimplementedError();
  }
}
