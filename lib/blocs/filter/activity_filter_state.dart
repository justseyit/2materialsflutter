part of 'activity_filter_cubit.dart';

abstract class ActivityFilterState extends Equatable {
  const ActivityFilterState();
}

class ActivityFilterInitial extends ActivityFilterState {
  @override
  List<Object> get props => [];

  FilterType get currentFilterType => BoredActivityRepository.instance.currentFilter.filterType;
}
