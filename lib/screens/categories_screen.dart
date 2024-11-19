import 'package:flutter/material.dart';
import 'package:meals/main.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("pick your category"),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: const [
          Text(
            "1",
            style: TextStyle(color: Colors.white),
          ),
          Text("2", style: TextStyle(color: Colors.white)),
          Text("3", style: TextStyle(color: Colors.white)),
          Text("4", style: TextStyle(color: Colors.white)),
          Text("5", style: TextStyle(color: Colors.white)),
          Text("6", style: TextStyle(color: Colors.white)),
          Text("7", style: TextStyle(color: Colors.white)),
          Text("8", style: TextStyle(color: Colors.white)),
          Text("9", style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
