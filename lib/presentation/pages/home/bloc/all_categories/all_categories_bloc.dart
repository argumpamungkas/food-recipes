import 'package:bloc/bloc.dart';
import 'package:food_recipes/data/models/all_categories_food.dart';
import 'package:food_recipes/data/repository/meal_repository.dart';
import 'package:meta/meta.dart';

part 'all_categories_event.dart';
part 'all_categories_state.dart';

class AllCategoriesBloc extends Bloc<AllCategoriesEvent, AllCategoriesState> {
  AllCategoriesBloc() : super(AllCategoriesInitial()) {
    on<EventAllCategories>((event, emit) async {
      emit(AllCategoriesLoading());
      List<AllCategoriesFood> result =
          await MealRepository().getAllCatgeoriesFood();
      emit(AllCategoriesSuccess(result));
    });
  }
}
