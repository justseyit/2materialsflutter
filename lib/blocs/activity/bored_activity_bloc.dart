import 'package:candidateapp/models/bored_activity.dart';
import 'package:candidateapp/models/filters/filter.dart';
import 'package:candidateapp/repositories/bored_activity_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'bored_activity_event.dart';
part 'bored_activity_state.dart';

///The businness logic component class to bind events and states.
class BoredActivityBloc extends Bloc<BoredActivityEvent, BoredActivityState> {
  BoredActivityBloc() : super(BoredActivityInitial()) {
    on<BoredActivityEvent>((event, emit) {});
    on<FetchBoredActivityEvent>((event, emit) async{
      try{
        emit(FetchingBoredActivityState());
        BoredActivity activity = await BoredActivityRepository.instance.getRandomActivityByFilter(filter: event.filter);
        emit(FetchedBoredActivityState(activity: activity));
      }
      catch(ex){
        emit(CantFetchBoredActivityState());
        rethrow;
      }
    });
  }
}
