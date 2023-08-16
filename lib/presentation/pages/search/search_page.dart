// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/presentation/pages/search/bloc/search_food_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "SEARCH FAV FOOD",
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
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Theme(
              data: Theme.of(context).copyWith(
                  colorScheme:
                      ThemeData().colorScheme.copyWith(primary: Colors.black)),
              child: TextField(
                controller: searchController,
                autocorrect: false,
                maxLines: 1,
                cursorColor: Colors.amber,
                textInputAction: TextInputAction.done,
                onChanged: (value) => context.read<SearchFoodBloc>().add(
                      EventSearchFood(value),
                    ),
                decoration: InputDecoration(
                  label: const Text("Search"),
                  prefixIcon: const Icon(
                    Icons.search,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: BlocBuilder<SearchFoodBloc, SearchFoodState>(
                builder: (context, state) {
                  if (state is SearchFoodLoading) {
                    return Center(
                      child: LoadingAnimationWidget.horizontalRotatingDots(
                        color: Colors.black,
                        size: 50,
                      ),
                    );
                  }

                  if (state is SearchFoodEmpty) {
                    return Center(
                      child: Text("'${searchController.text}' is Not Found"),
                    );
                  }

                  if (state is SearchFoodSuccess) {
                    return ListView.builder(
                      itemCount: state.allFood.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () => Navigator.pushNamed(
                            context,
                            "/detailFood",
                            arguments: state.allFood[index].id,
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
                              imageUrl: state.allFood[index].mealThumb,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
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
                              progressIndicatorBuilder:
                                  (context, url, progress) {
                                return Center(
                                  child:
                                      LoadingAnimationWidget.threeArchedCircle(
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

                  return const Center();
                },
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
