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
      color: Colors.grey.shade200,
      borderRadius: BorderRadius.circular(10),
      elevation: 5,
      child: InkWell(
        onTap: () {},
        splashColor: Colors.amber,
        hoverColor: Colors.amber,
        highlightColor: Colors.amber,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: width - 100,
          height: 150,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 2,
              color: Colors.amber,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                flex: 1,
                child: Container(
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
                flex: 2,
                fit: FlexFit.tight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      titleFood,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "$titleArea, $titleCategory",
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Suitible",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
