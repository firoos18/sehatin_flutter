import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:sehatin_flutter/widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 300,
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (ctx, idx) => const CartItem(),
                ),
              ),
              Row(
                children: const [
                  Icon(FeatherIcons.plusSquare),
                  SizedBox(width: 8),
                  Text('Tambah Menu Lain'),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sub Total',
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          fontSize: 14,
                        ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Rp',
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                            ),
                      ),
                      Text(
                        '66.000',
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ],
                  )
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Delivery Fee',
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          fontSize: 14,
                        ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Rp',
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                            ),
                      ),
                      Text(
                        '16.000',
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ],
                  )
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          fontSize: 20,
                        ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Rp',
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                            ),
                      ),
                      Text(
                        '82.000',
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32),
              FilledButton(
                onPressed: () {},
                style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xff1e1e1e),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    minimumSize: const Size(double.infinity, 52)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Checkout - ',
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          ),
                    ),
                    Text(
                      'Rp82.000',
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
