import 'package:flutter/material.dart';
import 'package:food_recipes/presentation/pages/favourite/favourite_page.dart';
import 'package:food_recipes/presentation/pages/home/home_page.dart';
import 'package:food_recipes/presentation/pages/search/search_page.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({super.key});

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  late int index;

  List showWidget = [
    const HomePage(),
    const SearchPage(),
    const FavouritePage(),
  ];

  @override
  void initState() {
    super.initState();
    index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: showWidget[index],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          selectedItemColor: Colors.amber.shade600,
          unselectedItemColor: Colors.grey.shade400,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 10,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: index == 1
                    ? const Icon(Icons.home_outlined)
                    : const Icon(Icons.home),
                label: "Home"),
            const BottomNavigationBarItem(
                icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(
                icon: index == 2
                    ? const Icon(Icons.favorite)
                    : const Icon(Icons.favorite_border_outlined),
                label: "Favourite"),
          ]),
    );
  }
}
