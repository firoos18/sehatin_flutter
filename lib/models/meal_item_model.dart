class MealItem {
  String id;
  String name;
  String topping;
  String price;
  double rating;
  String imageUrl;

  MealItem({
    required this.id,
    required this.name,
    required this.topping,
    required this.imageUrl,
    required this.price,
    required this.rating,
  });
}
