part of 'detail_food_category_bloc.dart';

@immutable
sealed class DetailFoodCategoryEvent {}

final class EventDetailFoodCategory extends DetailFoodCategoryEvent {
  String nameMeal;

  EventDetailFoodCategory(this.nameMeal);
}
