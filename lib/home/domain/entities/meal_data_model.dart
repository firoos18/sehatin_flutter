import 'package:uuid/uuid.dart';

const uuid = Uuid();

class MealItem {
  String id;
  String name;
  String topping;
  String price;
  double rating;
  String imageUrl;
  String description;

  MealItem({
    required this.name,
    required this.topping,
    required this.imageUrl,
    required this.price,
    required this.rating,
    required this.description,
  }) : id = uuid.v4();
}
