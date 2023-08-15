// ignore_for_file: must_be_immutable

part of 'search_food_bloc.dart';

@immutable
sealed class SearchFoodState {}

final class SearchFoodInitial extends SearchFoodState {}

final class SearchFoodLoading extends SearchFoodState {}

final class SearchFoodEmpty extends SearchFoodState {}

final class SearchFoodSuccess extends SearchFoodState {
  List<FilterFood> allFood;

  SearchFoodSuccess(this.allFood);
}
