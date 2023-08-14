import 'package:bloc/bloc.dart';
import 'package:food_recipes/data/models/food_ingredient.dart';
import 'package:food_recipes/data/repository/meal_repository.dart';
import 'package:meta/meta.dart';

part 'food_ingredient_event.dart';
part 'food_ingredient_state.dart';

class FoodIngredientBloc
    extends Bloc<FoodIngredientEvent, FoodIngredientState> {
  FoodIngredientBloc() : super(FoodIngredientInitial()) {
    on<EventFoodIngredient>((event, emit) async {
      emit(FoodIngredientLoading());
      List<FoodIngredient> allIngredient =
          await MealRepository().getAllIngredient();
      emit(FoodIngredientSuccess(allIngredient));
    });
  }
}
