import 'dart:convert';

import 'package:candidateapp/models/bored_activity.dart';
import 'package:candidateapp/models/filters/activity_participants.dart';
import 'package:candidateapp/models/filters/activity_price.dart';
import 'package:candidateapp/models/filters/activity_type.dart';
import 'package:candidateapp/models/filters/filter.dart';
import 'package:candidateapp/services/base/bored_activity.dart';
import 'package:candidateapp/utils/shared_prefs.dart';
import 'package:http/http.dart';

import '../../models/filters/activity_no_filter.dart';

//These methods have explanations. They are explained at the repository class.
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
  Future<BoredActivity> getRandomActivityByFilter({required Filter filter}) async {
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

  //#region Fetch by filter logics
  Future<BoredActivity> _noFilterFetch(ActivityNoFilter filter) async {
    Response response = await _client.get(Uri.parse('$_baseURL/activity'));
    if (response.statusCode == 200) {
      String mapString = response.body;
      return BoredActivity.fromMap(map: jsonDecode(mapString));
    } else {
      throw Exception('An error occoured while fetching data.');
    }
  }

  Future<BoredActivity> _participantsFilterFetch(ActivityParticipantsFilter filter) async {
    Response response = await _client.get(
        Uri.parse('$_baseURL/activity?participants=${filter.participants}'));
    if (response.statusCode == 200) {
      String mapString = response.body;
      return BoredActivity.fromMap(map: jsonDecode(mapString));
    } else {
      throw Exception('An error occoured while fetching data.');
    }
  }

  Future<BoredActivity> _priceFilterFetch(ActivityPriceFilter filter) async {
    Response response = await _client.get(Uri.parse(
        '$_baseURL/activity?minprice=${filter.minPrice}&maxprice=${filter.maxPrice}'));
    if (response.statusCode == 200) {
      String mapString = response.body;
      return BoredActivity.fromMap(map: jsonDecode(mapString));
    } else {
      throw Exception('An error occoured while fetching data.');
    }
  }

  Future<BoredActivity> _typeFilterFetch(ActivityTypeFilter filter) async {
    Response response = await _client
        .get(Uri.parse('$_baseURL/activity?type=${filter.activityType}'));
    if (response.statusCode == 200) {
      String mapString = response.body;
      return BoredActivity.fromMap(map: jsonDecode(mapString));
    } else {
      throw Exception('An error occoured while fetching data.');
    }
  }
  //#endregion

  @override
  Future<bool> addToFavs({required String activityID}) {
    try{
      List<String> favlist = SharedPrefsUtil.getStringList(key: 'favs') ?? [];
      if(!favlist.contains(activityID)){
        favlist.add(activityID);
      }
      SharedPrefsUtil.setStringList(key: 'favs', value: favlist);
      return Future.value(true);
    }
    catch(ex){
      rethrow;
    }
  }

  @override
  Future<bool> removeFromFavs({required String activityID}) {
    try{
      List<String> favlist = SharedPrefsUtil.getStringList(key: 'favs') ?? [];
      if(favlist.contains(activityID)){
        favlist.removeAt(favlist.indexOf(activityID));
      }
      SharedPrefsUtil.setStringList(key: 'favs', value: favlist);
      return Future.value(true);
    }
    catch(ex){
      rethrow;
    }
  }

  @override
  Future<BoredActivity> getActivityByID({required String activityID}) async {
    Response response =
        await _client.get(Uri.parse('$_baseURL/activity?key=$activityID'));
    if (response.statusCode == 200) {
      String mapString = response.body;
      return BoredActivity.fromMap(map: jsonDecode(mapString));
    } else {
      throw Exception('An error occoured while fetching data.');
    }
  }


  @override
  Future<List<BoredActivity>> get favs async{
    try{
      List<BoredActivity> acts = [];
      List<String> favlist = SharedPrefsUtil.getStringList(key: 'favs') ?? [];
      for(String id in favlist){
        acts.add(await getActivityByID(activityID: id));
      }
      return acts;
    }
    catch(ex){
      rethrow;
    }
  }

}
