part of 'favorite_activities_bloc.dart';

abstract class FavoriteActivitiesState extends Equatable {
  const FavoriteActivitiesState();
}

class FavoriteActivitiesInitial extends FavoriteActivitiesState {
  @override
  List<Object> get props => [];
}

class FetchingFavoriteActivitiesState extends FavoriteActivitiesState{
  @override
  List<Object?> get props => [];
}

class CantFetchFavoriteActivitiesState extends FavoriteActivitiesState{
  @override
  List<Object?> get props => [];
}

class FetchedFavoriteActivitiesState extends FavoriteActivitiesState{
  @override
  List<Object?> get props => [activities];
  final List<BoredActivity> activities;

  const FetchedFavoriteActivitiesState({required this.activities});
}