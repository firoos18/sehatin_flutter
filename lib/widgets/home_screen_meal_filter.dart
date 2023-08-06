import 'package:flutter/material.dart';
import 'package:sehatin_flutter/data/meal_filter_data.dart';

class MealFilter extends StatefulWidget {
  const MealFilter({super.key});

  @override
  State<MealFilter> createState() => _MealFilterState();
}

class _MealFilterState extends State<MealFilter> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 37,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: mealFilter.length,
        itemBuilder: (ctx, idx) => Padding(
          padding: const EdgeInsets.only(right: 10),
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(24),
            splashColor: const Color(0xff1e1e1e).withOpacity(0.5),
            child: Container(
              height: 37,
              width: 121,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: const Color(0xffF4F4F9)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(mealFilter[idx].icon),
                  const SizedBox(width: 4),
                  Text(mealFilter[idx].name)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
