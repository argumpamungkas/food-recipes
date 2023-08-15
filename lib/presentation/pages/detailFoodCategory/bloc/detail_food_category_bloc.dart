import 'package:bloc/bloc.dart';
import 'package:food_recipes/data/models/filter_food.dart';
import 'package:food_recipes/data/repository/meal_repository.dart';
import 'package:meta/meta.dart';

part 'detail_food_category_event.dart';
part 'detail_food_category_state.dart';

class DetailFoodCategoryBloc
    extends Bloc<DetailFoodCategoryEvent, DetailFoodCategoryState> {
  DetailFoodCategoryBloc() : super(DetailFoodCategoryInitial()) {
    on<EventDetailFoodCategory>((event, emit) async {
      emit(DetailFoodCategoryLoading());
      List<FilterFood> allFood =
          await MealRepository().getCategoryFilterFood(event.nameMeal);
      emit(DetailFoodCategorySuccess(allFood));
    });
  }
}
