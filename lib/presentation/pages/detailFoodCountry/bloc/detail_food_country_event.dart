// ignore_for_file: must_be_immutable

part of 'detail_food_country_bloc.dart';

@immutable
sealed class DetailFoodCountryEvent {}

final class EventDetailFoodCountry extends DetailFoodCountryEvent {
  String country;

  EventDetailFoodCountry(this.country);
}
