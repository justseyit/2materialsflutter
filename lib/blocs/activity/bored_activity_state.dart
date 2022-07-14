///This file contains states that possible while fetching the activities.

part of 'bored_activity_bloc.dart';



abstract class BoredActivityState extends Equatable {
  const BoredActivityState();
}

class BoredActivityInitial extends BoredActivityState {
  @override
  List<Object> get props => [];
}

class FetchingBoredActivityState extends BoredActivityState{
  @override
  List<Object?> get props => [];
}

class CantFetchBoredActivityState extends BoredActivityState{
  @override
  List<Object?> get props => [];
}

class FetchedBoredActivityState extends BoredActivityState{
  @override
  List<Object?> get props => [activity];
  final BoredActivity activity;

  const FetchedBoredActivityState({required this.activity});
}
