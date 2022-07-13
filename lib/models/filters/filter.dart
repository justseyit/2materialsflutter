enum FilterType { none, activityType, participants, price }

//This is the Filter parent abstract class that all filter types will be extended from it.
abstract class Filter {
  FilterType filterType;

  Filter({required this.filterType});
}
