part of 'cooking_idea_bloc.dart';

@immutable
sealed class CookingIdeaState {}

final class CookingIdeaInitial extends CookingIdeaState {}

final class CookingIdeaLoading extends CookingIdeaState {}

final class CookingIdeaSuccess extends CookingIdeaState {
  RandomFood randomFood;

  CookingIdeaSuccess(this.randomFood);
}

final class CookingIdeaError extends CookingIdeaState {}
