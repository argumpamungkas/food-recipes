import 'package:bloc/bloc.dart';
import 'package:food_recipes/data/models/detail_food.dart';
import 'package:food_recipes/data/repository/meal_repository.dart';
import 'package:meta/meta.dart';

part 'detail_food_event.dart';
part 'detail_food_state.dart';

class DetailFoodBloc extends Bloc<DetailFoodEvent, DetailFoodState> {
  DetailFoodBloc() : super(DetailFoodInitial()) {
    on<EventDetailFood>((event, emit) async {
      emit(DetailFoodLoading());
      DetailFood food = await MealRepository().getDetailFood(event.idMeal);
      emit(DetailFoodSuccess(food));
    });
  }
}
