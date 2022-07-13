import 'package:candidateapp/models/filters/filter.dart';

//A type of activity filters. Model class.
class ActivityParticipantsFilter implements Filter{
  @override
  FilterType filterType;
  int participants;
  ActivityParticipantsFilter({required this.filterType, required this.participants});
}