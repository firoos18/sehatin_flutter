import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum FoodType {
  meal,
  snack,
  dessert,
  vegan,
}

class MealItem {
  String id;
  String name;
  String topping;
  String price;
  double rating;
  String imageUrl;
  String description;
  FoodType foodType;

  MealItem({
    required this.name,
    required this.topping,
    required this.imageUrl,
    required this.price,
    required this.rating,
    required this.description,
    required this.foodType,
  }) : id = uuid.v4();
}
