import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    print("DIPANGGIL");
    return Scaffold(
      body: Center(
        child: Text("HOME"),
      ),
    );
  }
}
