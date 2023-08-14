import 'package:flutter/material.dart';

class ContainerAllCategory extends StatelessWidget {
  ContainerAllCategory({
    super.key,
    required this.thumbFood,
    required this.category,
  });

  String thumbFood;
  String category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: Colors.amber.shade200,
                  width: 2,
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    thumbFood,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(category),
          ],
        ),
      ),
    );
  }
}
