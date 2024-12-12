import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/providers/favourites_provider.dart';
import 'package:meals/providers/meals_provider.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/filters_screen.dart';
import 'package:meals/screens/meals_screen.dart';
import 'package:meals/widgets/main_drawer.dart';
import 'package:meals/providers/filters_provider.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({
    super.key,
  });

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  void _showInfoMessage(String message) {}

  // void _toggleMealFavouritesStatus(Meal meal) {
  //   final isExisting = _favouriteMeals.contains(meal);
  //   if (isExisting) {
  //     setState(() {
  //       _favouriteMeals.remove(meal);
  //     });
  //     _showInfoMessage('Meal is no longer favourite');
  //   } else {
  //     setState(() {
  //       _favouriteMeals.add(meal);
  //     });
  //     _showInfoMessage('Added to favourites');
  //   }
  // }

  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      await Navigator.of(context).push<Map<Filter, bool>>(
          MaterialPageRoute(builder: (ctx) => FiltersScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final _selectedFilters = ref.watch(filtersProvider);
    final meals = ref.watch(mealsProvider);
    final availableMeals = meals.where((meal) {
      if (_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (_selectedFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
    Widget activepage = CategoriesScreen(
      availableMeals: availableMeals,
    );
    String activepageTitle = 'Categories ';
    if (_selectedPageIndex == 1) {
      final favouriteMeals = ref.watch(favouriteMealsProvider);
      activepage = MealsScreen(
        meals: favouriteMeals,
      );
      activepageTitle = 'Your Favourites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activepageTitle),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: MainDrawer(onSelectScreen: _setScreen),
      body: activepage,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.onPrimary,
        selectedItemColor: Theme.of(context).colorScheme.onPrimary,
        selectedLabelStyle:
            const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        unselectedLabelStyle:
            TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        showUnselectedLabels: true,
        showSelectedLabels: true,
        elevation: 10,
        onTap: _selectedPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.category,
              ),
              label: "category"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
              ),
              label: "Favourite")
        ],
      ),
    );
  }
}
