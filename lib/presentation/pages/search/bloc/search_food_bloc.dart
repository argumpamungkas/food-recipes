import 'package:bloc/bloc.dart';
import 'package:food_recipes/data/models/filter_food.dart';
import 'package:food_recipes/data/repository/meal_repository.dart';
import 'package:meta/meta.dart';

part 'search_food_event.dart';
part 'search_food_state.dart';

class SearchFoodBloc extends Bloc<SearchFoodEvent, SearchFoodState> {
  SearchFoodBloc() : super(SearchFoodInitial()) {
    on<EventSearchFood>((event, emit) async {
      emit(SearchFoodLoading());
      List<FilterFood> allFood = await MealRepository().searchFood(event.food);
      if (allFood.isEmpty) {
        emit(SearchFoodEmpty());
      } else {
        emit(SearchFoodSuccess(allFood));
      }
    });
  }
}
