part of 'food_country_bloc.dart';

@immutable
sealed class FoodCountryState {}

final class FoodCountryInitial extends FoodCountryState {}

final class FoodCountryLoading extends FoodCountryState {}

final class FoodCountrySuccess extends FoodCountryState {
  List<FoodCountry> allCountry;

  FoodCountrySuccess(this.allCountry);
}
