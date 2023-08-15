import 'package:flutter/material.dart';

class CookingIdea extends StatelessWidget {
  CookingIdea({
    super.key,
    required this.width,
    required this.networkImageName,
    required this.titleFood,
    required this.titleCategory,
    required this.titleArea,
    required this.titleSuitible,
  });

  final double width;
  String networkImageName;
  String titleFood;
  String titleCategory;
  String titleArea;
  String titleSuitible;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey.shade100,
      borderRadius: BorderRadius.circular(10),
      elevation: 5,
      shadowColor: Colors.blueGrey.shade300,
      animationDuration: const Duration(seconds: 3),
      child: InkWell(
        onTap: () {},
        splashColor: Colors.amber,
        hoverColor: Colors.amber,
        highlightColor: Colors.amber,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          constraints: const BoxConstraints(maxHeight: 150),
          width: width - 100,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(networkImageName),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      titleFood,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "$titleArea, $titleCategory",
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Suitible",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      titleSuitible,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
