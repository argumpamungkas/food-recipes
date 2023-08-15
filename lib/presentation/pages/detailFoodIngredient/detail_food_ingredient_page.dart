import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/presentation/pages/detailFoodIngredient/bloc/detail_food_ingredient_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class DetailFoodIngredientPage extends StatefulWidget {
  const DetailFoodIngredientPage({super.key});

  @override
  State<DetailFoodIngredientPage> createState() =>
      _DetailFoodIngredientPageState();
}

class _DetailFoodIngredientPageState extends State<DetailFoodIngredientPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<DetailFoodIngredientBloc>().add(
            EventDetailFoodIngredient(
              ModalRoute.of(context)?.settings.arguments as String,
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String nameIngredient =
        ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white54,
        elevation: 0,
        title: Text(
          nameIngredient,
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<DetailFoodIngredientBloc, DetailFoodIngredientState>(
        builder: (context, state) {
          if (state is DetailFoodIngredientLoading) {
            return Center(
              child: LoadingAnimationWidget.inkDrop(
                color: Colors.black38,
                size: 50,
              ),
            );
          }

          if (state is DetailFoodIngredientSuccess) {
            return ListView.builder(
              itemCount: state.allFood.length,
              itemBuilder: (context, index) {
                return ListTile(
                  style: ListTileStyle.drawer,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  leading: SizedBox(
                    height: 80,
                    width: 80,
                    child: CachedNetworkImage(
                      imageUrl: state.allFood[index].mealThumb,
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
                  title: Text(state.allFood[index].mealName),
                  titleAlignment: ListTileTitleAlignment.center,
                );
              },
            );
          }

          return Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.width,
            width: 100,
            color: Colors.grey.shade200,
            child: const Text("Tidak dapat memuat data"),
          );
        },
      ),
    );
  }
}
