import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/data/const/api_const.dart';
import 'package:food_recipes/presentation/pages/foodByIngredients/bloc/food_ingredient_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class FoodIngredientsPage extends StatelessWidget {
  const FoodIngredientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white30,
        title: const Text(
          "FOOD BY INGREDIENTS",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: BlocBuilder<FoodIngredientBloc, FoodIngredientState>(
        builder: (context, state) {
          if (state is FoodIngredientLoading) {
            return Center(
              child: LoadingAnimationWidget.inkDrop(
                color: Colors.black38,
                size: 50,
              ),
            );
          }
          if (state is FoodIngredientSuccess) {
            return GridView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: state.allIngredient.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        child: CachedNetworkImage(
                          imageUrl:
                              "${ApiConst.baseUrlImage}/${state.allIngredient[index].ingredient}.png",
                          progressIndicatorBuilder: (context, url, progress) =>
                              Center(
                            child: LoadingAnimationWidget.flickr(
                              leftDotColor: Colors.amber,
                              rightDotColor: Colors.black,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        state.allIngredient[index].ingredient,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            );
          }
          return const Text("Terjadi Kesalahan");
        },
      ),
    );
  }
}
