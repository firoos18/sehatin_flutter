import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:sehatin_flutter/home/domain/entities/meal_data_model.dart';
import 'package:transparent_image/transparent_image.dart';

class CartCardItem extends StatefulWidget {
  final MealItem meal;
  final int count;

  const CartCardItem({required this.meal, required this.count, super.key});

  @override
  State<CartCardItem> createState() => _CartCardItemState();
}

class _CartCardItemState extends State<CartCardItem> {
  late int count = widget.count;
  late int mealPrice = int.parse(widget.meal.price);
  late int totalPrice = count * mealPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 16),
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(widget.meal.imageUrl),
              width: 103,
              height: 103,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${widget.meal.name} ${widget.meal.topping}",
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "Rp$totalPrice",
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            if (count >= 1) {
                              setState(() {
                                count -= 1;
                                totalPrice = mealPrice * count;
                              });
                            }
                          },
                          icon: const Icon(
                            FeatherIcons.minus,
                            size: 16,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          width: 40,
                          height: 32,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: const Color(0xffF4F4F9),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              count.toString(),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              count += 1;
                              totalPrice = mealPrice * count;
                            });
                          },
                          icon: const Icon(
                            FeatherIcons.plus,
                            size: 16,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        FeatherIcons.trash,
                        size: 16,
                      ),
                      color: Colors.red,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}