import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:sehatin_flutter/cart/data/cart_data.dart';
import 'package:sehatin_flutter/cart/domain/entities/cart_data_model.dart';
import 'package:sehatin_flutter/cart/presentation/bloc/cart_bloc.dart';
import 'package:sehatin_flutter/cart/presentation/screens/cart_screen.dart';
import 'package:sehatin_flutter/home/domain/entities/meal_data_model.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetailScreen extends StatefulWidget {
  final MealItem meal;

  const MealDetailScreen({required this.meal, super.key});

  @override
  State<MealDetailScreen> createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  int count = 1;
  late int mealPrice = int.parse(widget.meal.price);
  late int totalPrice = mealPrice * count;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  FadeInImage(
                    placeholder: MemoryImage(kTransparentImage),
                    image: NetworkImage(widget.meal.imageUrl),
                    width: double.infinity,
                    height: 312,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white70),
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(FeatherIcons.chevronLeft)),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white70),
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(FeatherIcons.heart)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.meal.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff1E1E1E),
                      ),
                    ),
                    Text(
                      widget.meal.topping,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        color: const Color(0xff1E1E1E).withOpacity(0.5),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Deskripsi",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff1E1E1E),
                      ),
                    ),
                    Text(
                      widget.meal.description,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff1E1E1E),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Harga",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff1E1E1E),
                              ),
                            ),
                            Text(
                              "Rp${widget.meal.price}",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w100,
                                color: Color(0xff1E1E1E),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 45,
                              height: 45,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffF4F4F9),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  if (count >= 1) {
                                    setState(() {
                                      count -= 1;
                                      totalPrice = mealPrice * count;
                                    });
                                  }
                                },
                                icon: const Icon(FeatherIcons.minus),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              width: 76,
                              height: 45,
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
                            Container(
                              width: 45,
                              height: 45,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffF4F4F9),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    count += 1;
                                    totalPrice = mealPrice * count;
                                  });
                                },
                                icon: const Icon(FeatherIcons.plus),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.07),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          minimumSize: const Size(double.infinity, 52),
                          backgroundColor: const Color(0xff1E1E1E),
                          foregroundColor: const Color(0xffF4F4F9),
                        ),
                        onPressed: () {
                          context.read<CartBloc>().add(
                                InsertCartData(
                                  cartItem: CartDataModel(
                                      count: count, meal: widget.meal),
                                ),
                              );

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CartScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Tambah ke Keranjang - Rp$totalPrice",
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
