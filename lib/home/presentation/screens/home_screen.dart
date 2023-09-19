import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:sehatin_flutter/cart/presentation/screens/cart_screen.dart';
import 'package:sehatin_flutter/home/data/meal_data.dart';
import 'package:sehatin_flutter/home/presentation/components/meal_card_item.dart';
import 'package:sehatin_flutter/home/presentation/components/meal_filter_item.dart';
import 'package:sehatin_flutter/user_profile/presentation/screens/user_profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        centerTitle: true,
        title: const Text(
          "Sehatin",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(FeatherIcons.bell))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16, top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 230,
                  child: Text(
                    'Ayo cari makanan dietmu!',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            TextField(
              decoration: InputDecoration(
                hintText: "Cari makanan",
                prefixIcon: const Icon(FeatherIcons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                fillColor: const Color(0xffF4F4F9),
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.black87),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const MealFilter(),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.only(bottom: 16, top: 12),
                itemCount: mealItemData.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 32,
                    mainAxisExtent: 243),
                itemBuilder: (ctx, idx) => MealCardItem(
                  meal: mealItemData[idx],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xff1E1E1E),
        unselectedItemColor: const Color(0xff1E1E1E).withOpacity(0.3),
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(FeatherIcons.home), label: "Beranda"),
          BottomNavigationBarItem(
              icon: Icon(FeatherIcons.shoppingCart), label: "Keranjang"),
          BottomNavigationBarItem(
              icon: Icon(FeatherIcons.user), label: "Profil"),
        ],
        onTap: (value) {
          if (value == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CartScreen(),
              ),
            );
          } else if (value == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const UserProfileScreen(),
              ),
            );
          }
        },
      ),
    );
  }
}
