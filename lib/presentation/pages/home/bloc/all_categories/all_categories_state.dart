part of 'all_categories_bloc.dart';

@immutable
sealed class AllCategoriesState {}

final class AllCategoriesInitial extends AllCategoriesState {}

final class AllCategoriesLoading extends AllCategoriesState {}

final class AllCategoriesSuccess extends AllCategoriesState {
  List<AllCategoriesFood> result;

  AllCategoriesSuccess(this.result);
}
