import 'package:candidateapp/models/filters/filter.dart';

//A type of activity filters. Model class.
class ActivityTypeFilter implements Filter{
  @override
  FilterType filterType;
  String activityType;
  ActivityTypeFilter({required this.filterType, required this.activityType});
}