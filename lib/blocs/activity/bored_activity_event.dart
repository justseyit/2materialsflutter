part of 'bored_activity_bloc.dart';

abstract class BoredActivityEvent extends Equatable {
  const BoredActivityEvent();
}

class FetchBoredActivityEvent extends BoredActivityEvent{
  @override
  List<Object?> get props => [filter];

  final Filter filter;

  const FetchBoredActivityEvent({required this.filter});

}
