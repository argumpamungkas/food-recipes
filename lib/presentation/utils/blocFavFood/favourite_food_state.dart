// ignore_for_file: must_be_immutable

part of 'favourite_food_bloc.dart';

@immutable
sealed class FavouriteFoodState {}

final class FavouriteFoodInitial extends FavouriteFoodState {}

final class FavouriteFoodLoading extends FavouriteFoodState {}

final class FoundFavouriteFood extends FavouriteFoodState {}

final class SuccessAddFavouriteFood extends FavouriteFoodState {}

final class SuccessGetAllFavouriteFood extends FavouriteFoodState {
  List<Map<String, dynamic>> allFavouriteFood;

  SuccessGetAllFavouriteFood(this.allFavouriteFood);
}

final class SuccessDeleteFavouriteFood extends FavouriteFoodState {}
