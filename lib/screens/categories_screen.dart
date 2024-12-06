import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category_model.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meals_screen.dart';

import 'package:meals/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.toggleMealFacouritesStatus});

  final Function(Meal) toggleMealFacouritesStatus;

  void _selectedCategory(BuildContext context, Category category) {
    final filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => MealsScreen(
              title: category.title,
              meals: filteredMeals,
              ontogglefavourites: toggleMealFacouritesStatus,
            )));
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelecteCategory: () {
                _selectedCategory(context, category);
              },
            )
        ]);
  }
}
