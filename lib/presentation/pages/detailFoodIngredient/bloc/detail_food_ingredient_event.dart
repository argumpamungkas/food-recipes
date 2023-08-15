part of 'detail_food_ingredient_bloc.dart';

@immutable
sealed class DetailFoodIngredientEvent {}

// ignore: must_be_immutable
final class EventDetailFoodIngredient extends DetailFoodIngredientEvent {
  String ingredient;

  EventDetailFoodIngredient(this.ingredient);
}
