import 'package:candidateapp/models/filters/filter.dart';

//A type of activity filters. Model class.
class ActivityPriceFilter implements Filter{
  @override
  FilterType filterType;
  double minPrice;
  double maxPrice;

  ActivityPriceFilter({required this.filterType, required this.minPrice, required this.maxPrice});
}