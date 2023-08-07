import 'package:uuid/uuid.dart';

const uuid = Uuid();

class MealItem {
  String id;
  String name;
  String topping;
  String price;
  double rating;
  String imageUrl;

  MealItem({
    required this.name,
    required this.topping,
    required this.imageUrl,
    required this.price,
    required this.rating,
  }) : id = uuid.v4();
}
