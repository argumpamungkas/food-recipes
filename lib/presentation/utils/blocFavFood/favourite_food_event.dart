// ignore_for_file: must_be_immutable

part of 'favourite_food_bloc.dart';

@immutable
sealed class FavouriteFoodEvent {}

final class EventAddFavouriteFood extends FavouriteFoodEvent {
  DetailFood detailFood;

  EventAddFavouriteFood(this.detailFood);
}

final class EventFoundFavouriteFood extends FavouriteFoodEvent {
  String idMeal;

  EventFoundFavouriteFood(this.idMeal);
}

final class EventGetAllFavouriteFood extends FavouriteFoodEvent {}

final class EventUpdateFavouriteFood extends FavouriteFoodEvent {}

final class EventDeleteFavouriteFood extends FavouriteFoodEvent {
  String idMeal;

  EventDeleteFavouriteFood(this.idMeal);
}
