import 'package:bloc/bloc.dart';
import 'package:food_recipes/data/models/filter_food.dart';
import 'package:food_recipes/data/repository/meal_repository.dart';
import 'package:meta/meta.dart';

part 'detail_food_country_event.dart';
part 'detail_food_country_state.dart';

class DetailFoodCountryBloc
    extends Bloc<DetailFoodCountryEvent, DetailFoodCountryState> {
  DetailFoodCountryBloc() : super(DetailFoodCountryInitial()) {
    on<EventDetailFoodCountry>((event, emit) async {
      emit(DetailFoodCountryLoading());
      List<FilterFood> allFood =
          await MealRepository().getCountryFilterFood(event.country);
      emit(DetailFoodCountrySuccess(allFood));
    });
  }
}
