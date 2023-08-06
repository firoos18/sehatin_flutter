import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:sehatin_flutter/widgets/home_screen_meal_filter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchTextController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16, top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 231,
            child: Text(
              'Ayo cari makanan dietmu!',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: searchTextController,
            decoration: const InputDecoration().copyWith(
              prefixIcon: const Icon(
                FeatherIcons.search,
                size: 24,
              ),
              hintText: 'Cari makanan',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none),
              filled: true,
              fillColor: const Color(0xffF4F4F9),
              focusColor: const Color(0xffF4F4F9),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(height: 24),
          const MealFilter()
        ],
      ),
    );
  }
}
