import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/presentation/pages/home/bloc/all_categories/all_categories_bloc.dart';
import 'package:food_recipes/presentation/pages/home/bloc/bloc_cooking_ide/cooking_idea_bloc.dart';
import 'package:food_recipes/presentation/pages/introduction/introduction_page.dart';
import 'package:food_recipes/presentation/pages/splash_screen/splash_screen.dart';
import 'package:food_recipes/presentation/widget/bottom_navigation_widget.dart';

class AppRoutes {
  var routes = <String, WidgetBuilder>{
    '/': (context) => const SplashScreen(),
    '/intro': (context) => const IntroductionPage(),
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
  };
}
