// ignore_for_file: must_be_immutable

part of 'detail_food_country_bloc.dart';

@immutable
sealed class DetailFoodCountryState {}

final class DetailFoodCountryInitial extends DetailFoodCountryState {}

final class DetailFoodCountryLoading extends DetailFoodCountryState {}

final class DetailFoodCountrySuccess extends DetailFoodCountryState {
  List<FilterFood> allFood;

  DetailFoodCountrySuccess(this.allFood);
}
