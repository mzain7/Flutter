import 'package:flutter/material.dart';
import 'package:food_app/model/meal.dart';
import 'package:food_app/screens/categories.dart';
import 'package:food_app/screens/meal.dart';
import 'package:food_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Meal> _favoriteMeals = [];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _setScreen(String identifier) {
    if (identifier == 'filters') {
    } else {
      Navigator.of(context).pop();
    }
  }

  void _toggleFavoriteMealStatus(Meal meal) {
    var isExisting = _favoriteMeals.contains(meal);
    if (isExisting) {
      setState(() {
        _favoriteMeals.remove(meal);
      });
      _showInfoMessage('Removed');
    } else {
      setState(() {
        _favoriteMeals.add(meal);
      });
      _showInfoMessage('Added');
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = CategoriesScreen(
      onToggleFavorite: _toggleFavoriteMealStatus,
    );
    var activePageTitle = 'Categories';
    if (_selectedPageIndex == 1) {
      activeScreen = MealsScreen(
        meals: _favoriteMeals,
        onToggleFavorite: _toggleFavoriteMealStatus,
      );
      activePageTitle = 'Favorites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(onSelectScreen: _setScreen),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favroites'),
        ],
      ),
    );
  }
}
