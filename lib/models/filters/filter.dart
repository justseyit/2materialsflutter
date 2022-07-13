///An enum to define the filter type.
enum FilterType { none, activityType, participants, price }

///This is the Filter parent abstract class that all filter types will be extended from it.
abstract class Filter {
  FilterType get filterType;
}
