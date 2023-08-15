part of 'detail_food_category_bloc.dart';

@immutable
sealed class DetailFoodCategoryState {}

final class DetailFoodCategoryInitial extends DetailFoodCategoryState {}

final class DetailFoodCategoryLoading extends DetailFoodCategoryState {}

final class DetailFoodCategorySuccess extends DetailFoodCategoryState {
  List<FilterFood> allFood;

  DetailFoodCategorySuccess(this.allFood);
}
