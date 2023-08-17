// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/data/models/detail_food.dart';
import 'package:food_recipes/presentation/pages/detailFood/bloc/detail_food_bloc.dart';
import 'package:food_recipes/presentation/utils/blocFavFood/favourite_food_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailFoodPage extends StatefulWidget {
  String idMeal;
  DetailFoodPage({super.key, required this.idMeal});

  @override
  State<DetailFoodPage> createState() => _DetailFoodPageState();
}

class _DetailFoodPageState extends State<DetailFoodPage> {
  @override
  void initState() {
    super.initState();
    context.read<DetailFoodBloc>().add(EventDetailFood(widget.idMeal));
    context
        .read<FavouriteFoodBloc>()
        .add(EventFoundFavouriteFood(widget.idMeal));
  }

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).viewPadding.top;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: statusBarHeight),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              BlocListener<FavouriteFoodBloc, FavouriteFoodState>(
                listener: (context, state) {
                  if (state is SuccessAddFavouriteFood) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Add to favourite food",
                          style: TextStyle(
                            color: Colors.amber,
                          ),
                        ),
                        backgroundColor: Colors.black,
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }

                  if (state is SuccessDeleteFavouriteFood) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Remove from favourite food",
                          style: TextStyle(
                            color: Colors.amber,
                          ),
                        ),
                        backgroundColor: Colors.black,
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                },
                child: BlocBuilder<DetailFoodBloc, DetailFoodState>(
                  builder: (context, state) {
                    if (state is DetailFoodLoading) {
                      return SizedBox(
                        width: width,
                        height: height,
                        child: Center(
                          child: LoadingAnimationWidget.inkDrop(
                            color: Colors.black38,
                            size: 50,
                          ),
                        ),
                      );
                    }

                    if (state is DetailFoodSuccess) {
                      DetailFood detailFood = state.food;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.bottomRight,
                            width: width,
                            height: height / 2,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: NetworkImage(
                                detailFood.mealThumb,
                              ),
                              fit: BoxFit.cover,
                            )),
                            child: BlocBuilder<FavouriteFoodBloc,
                                FavouriteFoodState>(
                              builder: (context, state) {
                                if (state is FoundFavouriteFood) {
                                  return InkWell(
                                    onTap: () async {
                                      context.read<FavouriteFoodBloc>().add(
                                          EventDeleteFavouriteFood(
                                              detailFood.id));
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      margin: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Colors.black12,
                                        borderRadius: BorderRadius.circular(50),
                                        border: Border.all(color: Colors.pink),
                                      ),
                                      child: const Icon(
                                        Icons.favorite,
                                        color: Colors.pink,
                                      ),
                                    ),
                                  );
                                }
                                return InkWell(
                                  onTap: () {
                                    context
                                        .read<FavouriteFoodBloc>()
                                        .add(EventAddFavouriteFood(detailFood));
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    margin: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.black12,
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(color: Colors.white),
                                    ),
                                    child: const Icon(
                                      Icons.favorite_outline,
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  detailFood.mealName,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),
                                ),
                                Text(
                                  "${detailFood.mealArea}, ${detailFood.mealCategory}",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(height: 3),
                                (detailFood.mealTags == "-")
                                    ? const SizedBox()
                                    : Text(
                                        "Suitible : ${detailFood.mealTags}",
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                const Divider(thickness: 2),
                                const Text(
                                  "INGREDIENTS",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                (detailFood.mealIngredient1 == "")
                                    ? const SizedBox()
                                    : Text(
                                        "${detailFood.mealIngredient1} : ${detailFood.mealMeasure1}",
                                      ),
                                (detailFood.mealIngredient2 == "")
                                    ? const SizedBox()
                                    : Text(
                                        "${detailFood.mealIngredient2} : ${detailFood.mealMeasure2}",
                                      ),
                                (detailFood.mealIngredient3 == "")
                                    ? const SizedBox()
                                    : Text(
                                        "${detailFood.mealIngredient3} : ${detailFood.mealMeasure3}",
                                      ),
                                (detailFood.mealIngredient4 == "")
                                    ? const SizedBox()
                                    : Text(
                                        "${detailFood.mealIngredient4} : ${detailFood.mealMeasure4}",
                                      ),
                                (detailFood.mealIngredient5 == "")
                                    ? const SizedBox()
                                    : Text(
                                        "${detailFood.mealIngredient5} : ${detailFood.mealMeasure5}",
                                      ),
                                (detailFood.mealIngredient6 == "")
                                    ? const SizedBox()
                                    : Text(
                                        "${detailFood.mealIngredient6} : ${detailFood.mealMeasure6}",
                                      ),
                                (detailFood.mealIngredient7 == "")
                                    ? const SizedBox()
                                    : Text(
                                        "${detailFood.mealIngredient7} : ${detailFood.mealMeasure7}",
                                      ),
                                (detailFood.mealIngredient8 == "")
                                    ? const SizedBox()
                                    : Text(
                                        "${detailFood.mealIngredient8} : ${detailFood.mealMeasure8}",
                                      ),
                                (detailFood.mealIngredient9 == "")
                                    ? const SizedBox()
                                    : Text(
                                        "${detailFood.mealIngredient9} : ${detailFood.mealMeasure9}",
                                      ),
                                (detailFood.mealIngredient10 == "")
                                    ? const SizedBox()
                                    : Text(
                                        "${detailFood.mealIngredient10} : ${detailFood.mealMeasure10}",
                                      ),
                                (detailFood.mealIngredient11 == "")
                                    ? const SizedBox()
                                    : Text(
                                        "${detailFood.mealIngredient11} : ${detailFood.mealMeasure11}",
                                      ),
                                (detailFood.mealIngredient12 == "")
                                    ? const SizedBox()
                                    : Text(
                                        "${detailFood.mealIngredient12} : ${detailFood.mealMeasure12}",
                                      ),
                                (detailFood.mealIngredient13 == "")
                                    ? const SizedBox()
                                    : Text(
                                        "${detailFood.mealIngredient13} : ${detailFood.mealMeasure13}",
                                      ),
                                (detailFood.mealIngredient14 == "")
                                    ? const SizedBox()
                                    : Text(
                                        "${detailFood.mealIngredient14} : ${detailFood.mealMeasure14}",
                                      ),
                                (detailFood.mealIngredient15 == "")
                                    ? const SizedBox()
                                    : Text(
                                        "${detailFood.mealIngredient15} : ${detailFood.mealMeasure15}",
                                      ),
                                (detailFood.mealIngredient16 == "")
                                    ? const SizedBox()
                                    : Text(
                                        "${detailFood.mealIngredient16} : ${detailFood.mealMeasure16}",
                                      ),
                                (detailFood.mealIngredient17 == "")
                                    ? const SizedBox()
                                    : Text(
                                        "${detailFood.mealIngredient17} : ${detailFood.mealMeasure17}",
                                      ),
                                (detailFood.mealIngredient18 == "")
                                    ? const SizedBox()
                                    : Text(
                                        "${detailFood.mealIngredient18} : ${detailFood.mealMeasure18}",
                                      ),
                                (detailFood.mealIngredient19 == "")
                                    ? const SizedBox()
                                    : Text(
                                        "${detailFood.mealIngredient19} : ${detailFood.mealMeasure19}",
                                      ),
                                (detailFood.mealIngredient20 == "")
                                    ? const SizedBox()
                                    : Text(
                                        "${detailFood.mealIngredient20} : ${detailFood.mealMeasure20}",
                                      ),
                                const Divider(thickness: 2),
                                const Text(
                                  "INSTRUCTIONS",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  detailFood.mealIntructions,
                                  textAlign: TextAlign.justify,
                                ),
                                const SizedBox(height: 15),
                                (detailFood.mealYoutube == "")
                                    ? const SizedBox()
                                    : ElevatedButton(
                                        onPressed: () async {
                                          Uri url =
                                              Uri.parse(detailFood.mealYoutube);
                                          if (await canLaunchUrl(url)) {
                                            await launchUrl(url);
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                    "Failed to Open Video"),
                                              ),
                                            );
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.amber,
                                          foregroundColor: Colors.black,
                                          fixedSize: Size(width, 50),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 20,
                                            vertical: 15,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                        ),
                                        child: const Text(
                                            "WATCHING VIDEO TUTORIAL"),
                                      ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }

                    return const Center(
                      child: Text("INIT"),
                    );
                  },
                ),
              ),
              Positioned(
                left: 5,
                top: 5,
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(0, 0, 0, 250),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Icon(Icons.arrow_back),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
