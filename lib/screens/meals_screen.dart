import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meal_details_screen.dart';
import 'package:meals/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
    required this.ontogglefavourites,
  });
  final String? title;
  final List<Meal> meals;
  final Function(Meal) ontogglefavourites;

  void _onSelectMeal(Meal meal, BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(
              meal: meal,
              ontogglefavourites: ontogglefavourites,
            )));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) => MealItem(
          meal: meals[index],
          onSelectMeal: (meal) {
            _onSelectMeal(meal, context);
          }),
    );
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Uh oh ...nothing here!'),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Try selecting a different category!',
              style:
                  textTheme.bodyLarge!.copyWith(color: colorScheme.onSurface),
            )
          ],
        ),
      );
    }
    if (title == null) {
      return content;
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(title!),
          backgroundColor: colorScheme.primary,
        ),
        body: content);
  }
}
