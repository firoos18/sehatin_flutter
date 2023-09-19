import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:sehatin_flutter/home/domain/entities/meal_data_model.dart';
import 'package:sehatin_flutter/meal_detail/presentation/screens/meal_detail_screen.dart';
import 'package:transparent_image/transparent_image.dart';

class MealCardItem extends StatelessWidget {
  final MealItem meal;

  const MealCardItem({required this.meal, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MealDetailScreen(meal: meal),
          ),
        );
      },
      child: Container(
        height: 243,
        width: 163,
        padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xffF4F4F9),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                width: double.infinity,
                height: 139,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              meal.name,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              meal.topping,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 10,
                    fontWeight: FontWeight.w200,
                    color: const Color(0xff1e1e1e).withOpacity(0.5),
                  ),
            ),
            const SizedBox(height: 19),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Rp',
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                    Text(
                      meal.price,
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .copyWith(fontWeight: FontWeight.w700, fontSize: 14),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      FeatherIcons.star,
                      size: 14,
                    ),
                    const SizedBox(width: 4),
                    Text(meal.rating.toString())
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
