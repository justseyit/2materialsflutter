import 'package:candidateapp/models/filters/filter.dart';

///A type of activity filters. Model class.
class ActivityTypeFilter implements Filter{
  @override
  final FilterType filterType = FilterType.activityType;
  final String activityType;
  ActivityTypeFilter({required this.activityType});
}