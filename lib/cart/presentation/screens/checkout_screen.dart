import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:sehatin_flutter/cart/presentation/bloc/cart_bloc.dart';
import 'package:sehatin_flutter/cart/presentation/components/cart_card_item.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        centerTitle: true,
        title: const Text(
          'Checkout',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Ringkasan keranjang',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Flexible(
                    flex: 2,
                    fit: FlexFit.loose,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(
                          parent: NeverScrollableScrollPhysics()),
                      itemCount: state.listCartItem!.length,
                      itemBuilder: (context, index) => CartCardItem(
                        meal: state.listCartItem![index].meal,
                        count: state.listCartItem![index].count,
                        isCheckout: true,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Opsi pengiriman',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    height: 48,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color(0xff1E1E1E).withOpacity(0.3)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(FeatherIcons.box),
                              SizedBox(width: 8),
                              Text(
                                'Pilih opsi pengiriman!',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Icon(FeatherIcons.chevronRight),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Rincian',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Sub Total',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'Rp${state.totalPrice}',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Ongkos pengiriman',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'Rp0',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            'Rp0',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    height: 48,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color(0xff1E1E1E).withOpacity(0.3)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(FeatherIcons.percent),
                              SizedBox(width: 8),
                              Text(
                                'Gunakan kode promo!',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Icon(FeatherIcons.chevronRight),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 36),
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
                    child: Text(
                      'Proses pembayaran - Rp${state.totalPrice}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
