part of 'favorite_activities_bloc.dart';

abstract class FavoriteActivitiesEvent extends Equatable {
  const FavoriteActivitiesEvent();
}

class FetchFavoriteActivitiesEvent extends FavoriteActivitiesEvent{
  @override
  List<Object?> get props => [];
}

class AddActivityToFavsEvent extends FavoriteActivitiesEvent{
  @override
  List<Object?> get props => [activityID];
  final String activityID;

  const AddActivityToFavsEvent({required this.activityID});
}

class RemoveActivityFromFavsEvent extends FavoriteActivitiesEvent{
  @override
  List<Object?> get props => [activityID];
  final String activityID;

  const RemoveActivityFromFavsEvent({required this.activityID});
}
