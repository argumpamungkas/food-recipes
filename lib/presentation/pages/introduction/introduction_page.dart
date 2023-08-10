import 'package:flutter/material.dart';
import 'package:food_recipes/presentation/widget/bottom_navigation_widget.dart';
import 'package:lottie/lottie.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double statusBarHeight = MediaQuery.of(context).viewPadding.top;
    return Scaffold(
      backgroundColor: Colors.amber.shade300,
      body: Padding(
        padding: EdgeInsets.only(
            top: statusBarHeight + 50, left: 20, right: 20, bottom: 20),
        child: Column(
          children: [
            const Text(
              "FOOD RECIPES",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 36,
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: width - 150,
              child: Lottie.asset(
                "assets/lottie/lottie_food.json",
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Learn To Cook Your Favourite Dishes At Home",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 26,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Make your favourite dishes, specialities from different countries and ingredients you have on hand.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black54,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottomNavigationWidget(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(width, 60),
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  )),
              child: const Text(
                "Get Started",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
