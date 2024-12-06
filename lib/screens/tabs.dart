import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/filters_screen.dart';
import 'package:meals/screens/meals_screen.dart';
import 'package:meals/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  final List<Meal> _favouriteMeals = [];

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: EdgeInsets.all(16),
        backgroundColor: Theme.of(context).colorScheme.error,
        margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        behavior: SnackBarBehavior.floating,
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onError),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80)),
      ),
    );
  }

  void _toggleMealFavouritesStatus(Meal meal) {
    final isExisting = _favouriteMeals.contains(meal);
    if (isExisting) {
      setState(() {
        _favouriteMeals.remove(meal);
      });
      _showInfoMessage('Meal is no longer favourite');
    } else {
      setState(() {
        _favouriteMeals.add(meal);
      });
      _showInfoMessage('Added to favourites');
    }
  }

  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => const FiltersScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activepage = CategoriesScreen(
      toggleMealFacouritesStatus: _toggleMealFavouritesStatus,
    );
    String activepageTitle = 'Categories ';
    if (_selectedPageIndex == 1) {
      activepage = MealsScreen(
        meals: _favouriteMeals,
        ontogglefavourites: _toggleMealFavouritesStatus,
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
            TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
