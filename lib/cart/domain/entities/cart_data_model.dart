import 'package:sehatin_flutter/home/domain/entities/meal_data_model.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class CartDataModel {
  String id;
  MealItem meal;
  int count;

  CartDataModel({required this.count, required this.meal}) : id = uuid.v4();
}
