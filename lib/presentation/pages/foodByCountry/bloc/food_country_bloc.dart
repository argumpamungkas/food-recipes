import 'package:bloc/bloc.dart';
import 'package:food_recipes/data/models/food_country.dart';
import 'package:food_recipes/data/repository/meal_repository.dart';
import 'package:meta/meta.dart';

part 'food_country_event.dart';
part 'food_country_state.dart';

class FoodCountryBloc extends Bloc<FoodCountryEvent, FoodCountryState> {
  FoodCountryBloc() : super(FoodCountryInitial()) {
    on<EventFoodCountry>((event, emit) async {
      emit(FoodCountryLoading());
      List<FoodCountry> allCountry = await MealRepository().getFoodCountry();
      emit(FoodCountrySuccess(allCountry));
    });
  }
}
