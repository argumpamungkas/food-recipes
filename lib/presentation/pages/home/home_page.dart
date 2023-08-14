import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/presentation/pages/home/bloc/all_categories/all_categories_bloc.dart';
import 'package:food_recipes/presentation/pages/home/bloc/bloc_cooking_ide/cooking_idea_bloc.dart';
import 'package:food_recipes/presentation/pages/home/widget/container_all_categories.dart.dart';
import 'package:shimmer/shimmer.dart';

import 'widget/container_cook_idea.dart';
import 'widget/container_filter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "FOOD RECIPES",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    flex: 1,
                    child: ContainerFilter(
                      width: width,
                      assetName: "assets/images/bg_country.webp",
                      iconData: Icons.flag,
                      title: "Food by Country",
                      navigate: () {},
                    ),
                  ),
                  const SizedBox(width: 20),
                  Flexible(
                    flex: 1,
                    child: ContainerFilter(
                      width: width,
                      assetName: "assets/images/bg_ingredients.jpg",
                      iconData: Icons.food_bank,
                      title: "Food by Ingredients",
                      navigate: () {},
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Divider(
                color: Colors.grey.shade300,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Cooking Idea",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              const SizedBox(height: 20),
              BlocBuilder<CookingIdeaBloc, CookingIdeaState>(
                builder: (context, state) {
                  if (state is CookingIdeaLoading) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey.shade100,
                      highlightColor: Colors.grey.shade300,
                      child: Container(
                        width: width - 100,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    );
                  }
                  if (state is CookingIdeaSuccess) {
                    return CookingIdea(
                      width: width,
                      networkImageName: state.randomFood.mealThumb,
                      titleFood: state.randomFood.nameMeal,
                      titleArea: state.randomFood.mealArea,
                      titleCategory: state.randomFood.mealCategory,
                      titleSuitible: state.randomFood.mealTags,
                    );
                  }
                  return CookingIdea(
                    width: width,
                    networkImageName:
                        "https://www.themealdb.com/images/media/meals/sywswr1511383814.jpg",
                    titleFood: "",
                    titleArea: "",
                    titleCategory: "",
                    titleSuitible: "",
                  );
                },
              ),
              const SizedBox(height: 20),
              Divider(
                color: Colors.grey.shade300,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "What's Cooking Now?",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              const SizedBox(height: 20),
              BlocBuilder<AllCategoriesBloc, AllCategoriesState>(
                builder: (context, state) {
                  if (state is AllCategoriesLoading) {
                    return GridView.builder(
                      itemCount: 9,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 1.6 / 2),
                      itemBuilder: (context, index) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey.shade100,
                          highlightColor: Colors.grey.shade300,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        );
                      },
                    );
                  }

                  if (state is AllCategoriesSuccess) {
                    return GridView.builder(
                      itemCount: state.result.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 1.6 / 2),
                      itemBuilder: (context, index) {
                        return Material(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(20),
                          child: InkWell(
                            onTap: () {},
                            splashColor: Colors.amber.shade200,
                            highlightColor: Colors.amber.shade200,
                            borderRadius: BorderRadius.circular(20),
                            child: ContainerAllCategory(
                              thumbFood: state.result[index].thumb,
                              category: state.result[index].category,
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return GridView.builder(
                    itemCount: 9,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 1.6 / 2),
                    itemBuilder: (context, index) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade300,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
