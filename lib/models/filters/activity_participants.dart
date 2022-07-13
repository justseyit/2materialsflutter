import 'package:candidateapp/models/filters/filter.dart';

///A type of activity filters. Model class.
class ActivityParticipantsFilter implements Filter{
  @override
  final FilterType filterType = FilterType.participants;
  final int participants;
  ActivityParticipantsFilter({required this.participants});
}