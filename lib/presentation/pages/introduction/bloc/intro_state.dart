part of 'intro_bloc.dart';

@immutable
sealed class IntroState {}

final class IntroInitial extends IntroState {}

final class IntroLoading extends IntroState {}

final class IntroSuccess extends IntroState {}
