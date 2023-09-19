import 'package:sehatin_flutter/home/domain/entities/meal_data_model.dart';

class CartDataModel {
  MealItem meal;
  int count;

  CartDataModel({required this.count, required this.meal});
}
