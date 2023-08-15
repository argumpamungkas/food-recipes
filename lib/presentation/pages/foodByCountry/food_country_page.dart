import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/presentation/pages/foodByCountry/bloc/food_country_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class FoodCountryPage extends StatelessWidget {
  const FoodCountryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white30,
        title: const Text(
          "FOOD BY COUNTRY",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: BlocBuilder<FoodCountryBloc, FoodCountryState>(
        builder: (context, state) {
          if (state is FoodCountryLoading) {
            return Center(
              child: LoadingAnimationWidget.inkDrop(
                color: Colors.black38,
                size: 50,
              ),
            );
          }
          if (state is FoodCountrySuccess) {
            return GridView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: state.allCountry.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => Navigator.pushNamed(
                    context,
                    "/detailFoodCountry",
                    arguments: state.allCountry[index].country,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                            "assets/images/flags/${state.allCountry[index].country}.png"),
                        Text(state.allCountry[index].country),
                      ],
                    ),
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
