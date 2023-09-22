import 'package:sehatin_flutter/home/domain/entities/meal_data_model.dart';

class MealFilterModel {
  String icon;
  String name;
  FoodType foodType;

  MealFilterModel({
    required this.icon,
    required this.name,
    required this.foodType,
  });
}
