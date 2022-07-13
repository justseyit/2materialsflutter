import 'package:candidateapp/models/filters/filter.dart';

///A type of activity filters. Model class.
class ActivityPriceFilter implements Filter{
  @override
  final FilterType filterType = FilterType.price;
  final double minPrice;
  final double maxPrice;

  ActivityPriceFilter({required this.minPrice, required this.maxPrice});
}