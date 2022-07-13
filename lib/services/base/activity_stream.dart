import 'package:candidateapp/models/bored_activity.dart';

abstract class ActivityStreamBase{
  Future<bool> addActivityToStream();
}