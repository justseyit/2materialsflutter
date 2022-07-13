import 'package:candidateapp/repositories/bored_activity_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:candidateapp/models/filters/filter.dart';
import 'package:equatable/equatable.dart';

part 'activity_filter_state.dart';

class ActivityFilterCubit extends Cubit<ActivityFilterState> {
  ActivityFilterCubit() : super(ActivityFilterInitial());

  /*void changeFilterType({required FilterType filterType}){
    emit(ActivityFilterInitial(currentFilterType: filterType));
  }*/
}
