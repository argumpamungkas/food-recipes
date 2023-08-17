import 'package:bloc/bloc.dart';
import 'package:food_recipes/data/models/detail_food.dart';
import 'package:food_recipes/data/repository/database_repository.dart';
import 'package:meta/meta.dart';

part 'favourite_food_event.dart';
part 'favourite_food_state.dart';

class FavouriteFoodBloc extends Bloc<FavouriteFoodEvent, FavouriteFoodState> {
  FavouriteFoodBloc() : super(FavouriteFoodInitial()) {
    final _favRepos = DatabaseRepo();
    on<EventAddFavouriteFood>((event, emit) async {
      await _favRepos.addFavourite(event.detailFood);
      emit(SuccessAddFavouriteFood());
      await _favRepos.getFoundFavourite(event.detailFood.id);
      emit(FoundFavouriteFood());
    });
    on<EventGetAllFavouriteFood>((event, emit) async {
      emit(FavouriteFoodLoading());
      List<Map<String, dynamic>> allFavouriteFood =
          await _favRepos.getAllFavourite();
      if (allFavouriteFood.isEmpty) {
        emit(FavouriteFoodInitial());
      } else {
        emit(SuccessGetAllFavouriteFood(allFavouriteFood));
      }
    });
    on<EventFoundFavouriteFood>((event, emit) async {
      Map<String, dynamic>? favFood =
          await _favRepos.getFoundFavourite(event.idMeal);
      if (favFood == null) {
        emit(FavouriteFoodInitial());
      } else {
        emit(FoundFavouriteFood());
      }
    });
    on<EventDeleteFavouriteFood>((event, emit) async {
      await _favRepos.deleteFavouriteFood(event.idMeal);
      emit(SuccessDeleteFavouriteFood());
      await _favRepos.getFoundFavourite(event.idMeal);
      emit(FavouriteFoodInitial());
      List<Map<String, dynamic>> allFavouriteFood =
          await _favRepos.getAllFavourite();
      if (allFavouriteFood.isEmpty) {
        emit(FavouriteFoodInitial());
      } else {
        emit(SuccessGetAllFavouriteFood(allFavouriteFood));
      }
    });
  }
}
