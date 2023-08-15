import 'package:bloc/bloc.dart';
import 'package:food_recipes/data/models/filter_food.dart';
import 'package:food_recipes/data/repository/meal_repository.dart';
import 'package:meta/meta.dart';

part 'detail_food_ingredient_event.dart';
part 'detail_food_ingredient_state.dart';

class DetailFoodIngredientBloc
    extends Bloc<DetailFoodIngredientEvent, DetailFoodIngredientState> {
  DetailFoodIngredientBloc() : super(DetailFoodIngredientInitial()) {
    on<EventDetailFoodIngredient>((event, emit) async {
      emit(DetailFoodIngredientLoading());
      List<FilterFood> allFood =
          await MealRepository().getIngredientFilterFood(event.ingredient);
      emit(DetailFoodIngredientSuccess(allFood));
    });
  }
}
