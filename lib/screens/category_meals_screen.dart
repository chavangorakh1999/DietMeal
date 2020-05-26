import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';
import '../models/meal.dart';
class CategoryMealscreen extends StatefulWidget {
  static const routeName = '/category-meal';
  
  final List<Meal> availableMeal;
  CategoryMealscreen(this.availableMeal);
  @override
  _CategoryMealscreenState createState() => _CategoryMealscreenState();
}

class _CategoryMealscreenState extends State<CategoryMealscreen> {
String categoryTitle;
var _loadedInitData=false;
List<Meal> displayedMeal;

// @override
//   void initState() {
    
//     super.initState();
//   }
  @override
  void didChangeDependencies() {
    if(!_loadedInitData)
    {
    final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    categoryTitle = routeArg['title'];
    final categoryId = routeArg['id'];
     displayedMeal = widget.availableMeal.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    _loadedInitData=true;
    }
    super.didChangeDependencies();

  }
  void _removeMeal(String mealId){
    setState(() {
      displayedMeal.removeWhere((meal) => meal.id==mealId);
    });
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id:displayedMeal[index].id,
              title: displayedMeal[index].title,
              imageUrl: displayedMeal[index].imageUrl,
              duration: displayedMeal[index].duration,
              complexity: displayedMeal[index].complexity,
              affordability: displayedMeal[index].affordability,
              removeItem: _removeMeal,
            );
          },
          itemCount: displayedMeal.length,
        ));
  }
}
