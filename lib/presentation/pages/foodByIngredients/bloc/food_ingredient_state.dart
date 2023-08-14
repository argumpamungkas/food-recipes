part of 'food_ingredient_bloc.dart';

@immutable
sealed class FoodIngredientState {}

final class FoodIngredientInitial extends FoodIngredientState {}

final class FoodIngredientLoading extends FoodIngredientState {}

final class FoodIngredientSuccess extends FoodIngredientState {
  List<FoodIngredient> allIngredient;

  FoodIngredientSuccess(this.allIngredient);
}
