import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/presentation/utils/blocFavFood/favourite_food_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<FavouriteFoodBloc>().add(
            EventGetAllFavouriteFood(),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "FAVOURITE FOOD",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.amber,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(2),
            child: Container(
              color: Colors.black,
              height: 2,
            ),
          ),
        ),
        body: BlocBuilder<FavouriteFoodBloc, FavouriteFoodState>(
          builder: (context, state) {
            if (state is FavouriteFoodLoading) {
              return Center(
                child: LoadingAnimationWidget.inkDrop(
                  color: Colors.black38,
                  size: 50,
                ),
              );
            }
            if (state is SuccessGetAllFavouriteFood) {
              return ListView.builder(
                itemCount: state.allFavouriteFood.length,
                itemBuilder: (context, index) {
                  var food = state.allFavouriteFood[index];
                  return ListTile(
                    onTap: () => Navigator.pushNamed(
                      context,
                      '/detailFood',
                      arguments: food['id_meal'],
                    ),
                    style: ListTileStyle.drawer,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                    leading: SizedBox(
                      height: 80,
                      width: 80,
                      child: CachedNetworkImage(
                        imageUrl: "${food['meal_thumb']}",
                        imageBuilder: (context, imageProvider) => Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        progressIndicatorBuilder: (context, url, progress) {
                          return Center(
                            child: LoadingAnimationWidget.threeArchedCircle(
                                color: Colors.amber, size: 25),
                          );
                        },
                      ),
                    ),
                    title: Text("${food['meal_name']}"),
                    titleAlignment: ListTileTitleAlignment.center,
                  );
                },
              );
            }
            return const Center(
                child: Text(
              "Favourite Food is Empty",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
              ),
            ));
          },
        ));
  }
}
