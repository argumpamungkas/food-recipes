// ignore_for_file: must_be_immutable

part of 'search_food_bloc.dart';

@immutable
sealed class SearchFoodEvent {}

final class EventSearchFood extends SearchFoodEvent {
  String food;

  EventSearchFood(this.food);
}
