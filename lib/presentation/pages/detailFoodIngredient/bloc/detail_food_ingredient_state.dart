// ignore_for_file: must_be_immutable

part of 'detail_food_ingredient_bloc.dart';

@immutable
sealed class DetailFoodIngredientState {}

final class DetailFoodIngredientInitial extends DetailFoodIngredientState {}

final class DetailFoodIngredientLoading extends DetailFoodIngredientState {}

final class DetailFoodIngredientSuccess extends DetailFoodIngredientState {
  List<FilterFood> allFood;

  DetailFoodIngredientSuccess(this.allFood);
}
