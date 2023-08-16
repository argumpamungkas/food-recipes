// ignore_for_file: must_be_immutable

part of 'detail_food_bloc.dart';

@immutable
sealed class DetailFoodEvent {}

final class EventDetailFood extends DetailFoodEvent {
  String idMeal;

  EventDetailFood(this.idMeal);
}
