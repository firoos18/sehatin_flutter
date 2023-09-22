import 'package:sehatin_flutter/home/domain/entities/meal_data_model.dart';
import 'package:sehatin_flutter/home/domain/entities/meal_filter_model.dart';

final mealFilterData = [
  MealFilterModel(
    icon: 'lib/core/assets/meal.png',
    name: 'Meal',
    foodType: FoodType.meal,
  ),
  MealFilterModel(
    icon: 'lib/core/assets/snack.png',
    name: 'Snack',
    foodType: FoodType.snack,
  ),
  MealFilterModel(
    icon: 'lib/core/assets/dessert.png',
    name: 'Dessert',
    foodType: FoodType.dessert,
  ),
  MealFilterModel(
    icon: 'lib/core/assets/vegan.png',
    name: 'Vegan',
    foodType: FoodType.vegan,
  )
];
