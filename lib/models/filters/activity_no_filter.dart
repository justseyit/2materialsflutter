import 'package:candidateapp/models/filters/filter.dart';

//A type of activity filters. Model class.
class ActivityNoFilter implements Filter{
  @override
  FilterType filterType;

  ActivityNoFilter({required this.filterType});
}