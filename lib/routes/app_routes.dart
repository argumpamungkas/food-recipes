import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/presentation/pages/detailFood/bloc/detail_food_bloc.dart';
import 'package:food_recipes/presentation/pages/detailFood/detail_food_page.dart';
import 'package:food_recipes/presentation/pages/detailFoodCategory/bloc/detail_food_category_bloc.dart';
import 'package:food_recipes/presentation/pages/detailFoodCategory/detail_food_category.dart';
import 'package:food_recipes/presentation/pages/detailFoodCountry/bloc/detail_food_country_bloc.dart';
import 'package:food_recipes/presentation/pages/detailFoodCountry/detail_food_country_page.dart';
import 'package:food_recipes/presentation/pages/detailFoodIngredient/bloc/detail_food_ingredient_bloc.dart';
import 'package:food_recipes/presentation/pages/detailFoodIngredient/detail_food_ingredient_page.dart';
import 'package:food_recipes/presentation/pages/foodByCountry/bloc/food_country_bloc.dart';
import 'package:food_recipes/presentation/pages/foodByCountry/food_country_page.dart';
import 'package:food_recipes/presentation/pages/foodByIngredients/bloc/food_ingredient_bloc.dart';
import 'package:food_recipes/presentation/pages/foodByIngredients/food_ingredients_page.dart';
import 'package:food_recipes/presentation/pages/home/bloc/all_categories/all_categories_bloc.dart';
import 'package:food_recipes/presentation/pages/home/bloc/bloc_cooking_ide/cooking_idea_bloc.dart';
import 'package:food_recipes/presentation/pages/introduction/bloc/intro_bloc.dart';
import 'package:food_recipes/presentation/pages/introduction/introduction_page.dart';
import 'package:food_recipes/presentation/pages/search/bloc/search_food_bloc.dart';
import 'package:food_recipes/presentation/pages/splashScreen/splash_screen.dart';
import 'package:food_recipes/presentation/utils/blocFavFood/favourite_food_bloc.dart';
import 'package:food_recipes/presentation/utils/widget/bottom_navigation_widget.dart';

class AppRoutes {
  final FavouriteFoodBloc _favouriteFoodBloc = FavouriteFoodBloc();

  Route onRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case "/intro":
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => IntroBloc(),
            child: const IntroductionPage(),
          ),
        );
      case "/home":
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(providers: [
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
            BlocProvider(
              create: (context) => SearchFoodBloc(),
            ),
            BlocProvider.value(
              value: _favouriteFoodBloc,
            ),
          ], child: const BottomNavigationWidget()),
        );
      case '/foodCountryPage':
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => FoodCountryBloc()..add(EventFoodCountry()),
            child: const FoodCountryPage(),
          ),
        );
      case '/foodIngredientsPage':
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                FoodIngredientBloc()..add(EventFoodIngredient()),
            child: const FoodIngredientsPage(),
          ),
        );
      case '/detailFoodCategory':
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => DetailFoodCategoryBloc(),
            child: DetailFoodCategoryPage(categoryName: args as String),
          ),
        );
      case '/detailFoodCountry':
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => DetailFoodCountryBloc(),
            child: DetailFoodCountryPage(nameCountry: args as String),
          ),
        );
      case '/detailFoodIngredient':
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => DetailFoodIngredientBloc(),
            child: DetailFoodIngredientPage(nameIngredient: args as String),
          ),
        );
      case '/detailFood':
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => DetailFoodBloc(),
              ),
              BlocProvider.value(
                value: _favouriteFoodBloc,
              ),
            ],
            child: DetailFoodPage(idMeal: args as String),
          ),
        );
      default:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
    }
  }
  // final _favFoodBloc = FavouriteFoodBloc();
  // static final routes = <String, WidgetBuilder>{
  //   '/': (context) => const SplashScreen(),
  //   '/intro': (context) => BlocProvider(
  //         create: (context) => IntroBloc(),
  //         child: const IntroductionPage(),
  //       ),
  //   '/home': (context) => MultiBlocProvider(providers: [
  //         BlocProvider(
  //           create: (context) => CookingIdeaBloc()
  //             ..add(
  //               EventCookingIdea(),
  //             ),
  //         ),
  //         BlocProvider(
  //           create: (context) => AllCategoriesBloc()
  //             ..add(
  //               EventAllCategories(),
  //             ),
  //         ),
  //         BlocProvider(
  //           create: (context) => SearchFoodBloc(),
  //         ),
  //         BlocProvider(
  //           create: (context) => FavouriteFoodBloc(),
  //         ),
  //       ], child: const BottomNavigationWidget()),
  //   '/foodCountryPage': (context) => BlocProvider(
  //         create: (context) => FoodCountryBloc()..add(EventFoodCountry()),
  //         child: const FoodCountryPage(),
  //       ),
  //   '/foodIngredientsPage': (context) => BlocProvider(
  //         create: (context) => FoodIngredientBloc()..add(EventFoodIngredient()),
  //         child: const FoodIngredientsPage(),
  //       ),
  //   '/detailFoodCategory': (context) => BlocProvider(
  //         create: (context) => DetailFoodCategoryBloc(),
  //         child: const DetailFoodCategoryPage(),
  //       ),
  //   '/detailFoodCountry': (context) => BlocProvider(
  //         create: (context) => DetailFoodCountryBloc(),
  //         child: const DetailFoodCountryPage(),
  //       ),
  //   '/detailFoodIngredient': (context) => BlocProvider(
  //         create: (context) => DetailFoodIngredientBloc(),
  //         child: const DetailFoodIngredientPage(),
  //       ),
  //   '/detailFood': (context) => MultiBlocProvider(
  //         providers: [
  //           BlocProvider(
  //             create: (context) => DetailFoodBloc(),
  //           ),
  //           BlocProvider.value(
  //             value: FavouriteFoodBloc(),
  //           ),
  //         ],
  //         child: const DetailFoodPage(),
  //       ),
  //   // (context) => BlocProvider(
  //   //       create: (context) => DetailFoodBloc(),
  //   //       child: const DetailFoodPage(),
  //   //     )
  // };
}
