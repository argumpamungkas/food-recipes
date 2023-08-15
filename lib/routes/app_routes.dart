import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/presentation/pages/detailFoodCategory/bloc/detail_food_category_bloc.dart';
import 'package:food_recipes/presentation/pages/detailFoodCategory/detail_food_category.dart';
import 'package:food_recipes/presentation/pages/detailFoodCountry/bloc/detail_food_country_bloc.dart';
import 'package:food_recipes/presentation/pages/detailFoodCountry/detail_food_country_page.dart';
import 'package:food_recipes/presentation/pages/foodByCountry/bloc/food_country_bloc.dart';
import 'package:food_recipes/presentation/pages/foodByCountry/food_country_page.dart';
import 'package:food_recipes/presentation/pages/foodByIngredients/bloc/food_ingredient_bloc.dart';
import 'package:food_recipes/presentation/pages/foodByIngredients/food_ingredients_page.dart';
import 'package:food_recipes/presentation/pages/home/bloc/all_categories/all_categories_bloc.dart';
import 'package:food_recipes/presentation/pages/home/bloc/bloc_cooking_ide/cooking_idea_bloc.dart';
import 'package:food_recipes/presentation/pages/introduction/bloc/intro_bloc.dart';
import 'package:food_recipes/presentation/pages/introduction/introduction_page.dart';
import 'package:food_recipes/presentation/pages/splashScreen/splash_screen.dart';
import 'package:food_recipes/presentation/widget/bottom_navigation_widget.dart';

class AppRoutes {
  var routes = <String, WidgetBuilder>{
    '/': (context) => const SplashScreen(),
    '/intro': (context) => BlocProvider(
          create: (context) => IntroBloc(),
          child: const IntroductionPage(),
        ),
    '/home': (context) => MultiBlocProvider(providers: [
          BlocProvider(
            create: (context) => CookingIdeaBloc()
              ..add(
                EventCookingIdea(),
              ),
          ),
          BlocProvider(
            create: (context) => AllCategoriesBloc()
              ..add(
                EventAllCategories(),
              ),
          ),
        ], child: const BottomNavigationWidget()),
    '/foodCountryPage': (context) => BlocProvider(
          create: (context) => FoodCountryBloc()..add(EventFoodCountry()),
          child: const FoodCountryPage(),
        ),
    '/foodIngredientsPage': (context) => BlocProvider(
          create: (context) => FoodIngredientBloc()..add(EventFoodIngredient()),
          child: const FoodIngredientsPage(),
        ),
    '/detailFoodCategory': (context) => BlocProvider(
          create: (context) => DetailFoodCategoryBloc(),
          child: const DetailFoodCategoryPage(),
        ),
    '/detailFoodCountry': (context) => BlocProvider(
          create: (context) => DetailFoodCountryBloc(),
          child: const DetailFoodCountryPage(),
        ),
  };
}
