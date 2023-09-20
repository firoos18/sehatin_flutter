import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:sehatin_flutter/cart/presentation/bloc/cart_bloc.dart';
import 'package:sehatin_flutter/cart/presentation/components/cart_card_item.dart';
import 'package:sehatin_flutter/cart/presentation/screens/checkout_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    context.read<CartBloc>().add(const GetCartData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
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
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(
              child: Text('No item added to the cart yet :('),
            );
          }
          if (state is CartLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is CartLoaded) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      flex: 3,
                      child: ListView.builder(
                        physics: const ScrollPhysics(
                            parent: NeverScrollableScrollPhysics()),
                        shrinkWrap: true,
                        itemCount: state.listCartItem!.length,
                        itemBuilder: (ctx, idx) => CartCardItem(
                          meal: state.listCartItem![idx].meal,
                          count: state.listCartItem![idx].count,
                          isCheckout: false,
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.1),
                    Flexible(
                      fit: FlexFit.loose,
                      flex: 1,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Sub Total',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                'Rp${state.totalPrice}',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CheckoutScreen(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              minimumSize: const Size(double.infinity, 52),
                              backgroundColor: const Color(0xff1E1E1E),
                              foregroundColor: const Color(0xffF4F4F9),
                            ),
                            child: Text('Checkout - Rp${state.totalPrice}'),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }
          return const Center(
            child: Text(
              'No item added to the cart :(',
            ),
          );
        },
      ),
    );
  }
}
