import 'package:bloc/bloc.dart';
import 'package:food_recipes/data/models/random_food.dart';
import 'package:food_recipes/data/repository/meal_repository.dart';
import 'package:meta/meta.dart';

part 'cooking_idea_event.dart';
part 'cooking_idea_state.dart';

class CookingIdeaBloc extends Bloc<CookingIdeaEvent, CookingIdeaState> {
  CookingIdeaBloc() : super(CookingIdeaInitial()) {
    on<CookingIdeaEvent>((event, emit) async {
      emit(CookingIdeaLoading());
      var result = await MealRepository().getRandomFood();
      emit(CookingIdeaSuccess(result));
    });
  }
}
