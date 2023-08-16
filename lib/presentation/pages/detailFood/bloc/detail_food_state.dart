// ignore_for_file: must_be_immutable

part of 'detail_food_bloc.dart';

@immutable
sealed class DetailFoodState {}

final class DetailFoodInitial extends DetailFoodState {}

final class DetailFoodLoading extends DetailFoodState {}

final class DetailFoodSuccess extends DetailFoodState {
  DetailFood food;

  DetailFoodSuccess(this.food);
}
