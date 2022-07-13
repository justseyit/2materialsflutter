import 'package:candidateapp/models/bored_activity.dart';
import 'package:candidateapp/models/filters/activity_participants.dart';
import 'package:candidateapp/models/filters/activity_price.dart';
import 'package:candidateapp/models/filters/activity_type.dart';
import 'package:candidateapp/models/filters/filter.dart';
import 'package:candidateapp/services/base/bored_activity.dart';
import 'package:http/http.dart';

import '../../models/filters/activity_no_filter.dart';

class LiveBoredActivityService implements BoredActivityBase {
  static LiveBoredActivityService? _instance;

  static LiveBoredActivityService get instance {
    _instance ??= LiveBoredActivityService._internal();
    return _instance!;
  }

  LiveBoredActivityService._internal();

  static const String _baseURL = 'http://www.boredapi.com/api';
  static final Client _client = Client();

  @override
  Future<BoredActivity> getRandomActivityByFilter(
      {required Filter filter}) async {
    try {
      if (filter.filterType == FilterType.participants) {
        return await _participantsFilterFetch(filter as ActivityParticipantsFilter);
      } else if (filter.filterType == FilterType.price) {
        return await _priceFilterFetch(filter as ActivityPriceFilter);
      } else if (filter.filterType == FilterType.activityType) {
        return await _typeFilterFetch(filter as ActivityTypeFilter);
      } else {
        return await _noFilterFetch(filter as ActivityNoFilter);
      }
    } catch (ex) {
      rethrow;
    }
  }

  Future<BoredActivity> _noFilterFetch(ActivityNoFilter filter) async {
    Response response = await _client.get(Uri.parse('$_baseURL/activity'));
    if (response.statusCode == 200) {
      String mapString = response.body;
      return BoredActivity.fromMap(map: (mapString as Map<String, dynamic>));
    } else {
      throw Exception('An error occoured while fetching data.');
    }
  }

  Future<BoredActivity> _participantsFilterFetch(
      ActivityParticipantsFilter filter) async {
    Response response = await _client.get(
        Uri.parse('$_baseURL/activity?participants=${filter.participants}'));
    if (response.statusCode == 200) {
      String mapString = response.body;
      return BoredActivity.fromMap(map: (mapString as Map<String, dynamic>));
    } else {
      throw Exception('An error occoured while fetching data.');
    }
  }

  Future<BoredActivity> _priceFilterFetch(ActivityPriceFilter filter) async {
    Response response = await _client.get(Uri.parse(
        '$_baseURL/activity?minprice=${filter.minPrice}&maxprice=${filter.maxPrice}'));
    if (response.statusCode == 200) {
      String mapString = response.body;
      return BoredActivity.fromMap(map: (mapString as Map<String, dynamic>));
    } else {
      throw Exception('An error occoured while fetching data.');
    }
  }

  Future<BoredActivity> _typeFilterFetch(ActivityTypeFilter filter) async {
    Response response = await _client
        .get(Uri.parse('$_baseURL/activity?type=${filter.activityType}'));
    if (response.statusCode == 200) {
      String mapString = response.body;
      return BoredActivity.fromMap(map: (mapString as Map<String, dynamic>));
    } else {
      throw Exception('An error occoured while fetching data.');
    }
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
  Future<BoredActivity> getActivityByID({required String activityID}) async {
    Response response =
        await _client.get(Uri.parse('$_baseURL/activity?key=$activityID'));
    if (response.statusCode == 200) {
      String mapString = response.body;
      return BoredActivity.fromMap(map: (mapString as Map<String, dynamic>));
    } else {
      throw Exception('An error occoured while fetching data.');
    }
  }
}
