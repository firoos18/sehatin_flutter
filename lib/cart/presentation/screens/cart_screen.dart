import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:sehatin_flutter/cart/data/cart_data.dart';
import 'package:sehatin_flutter/cart/presentation/components/cart_card_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Keranjang",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(FeatherIcons.arrowLeft),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: ListView.builder(
                itemCount: cartData.length,
                itemBuilder: (ctx, idx) => CartCardItem(
                    meal: cartData[idx].meal, count: cartData[idx].count),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sub Total',
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        'Sub Total',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Delivery Fee',
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        'Delivery Fee',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Total',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      minimumSize: const Size(double.infinity, 52),
                      backgroundColor: const Color(0xff1E1E1E),
                      foregroundColor: const Color(0xffF4F4F9),
                    ),
                    child: const Text('Checkout - Total'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
