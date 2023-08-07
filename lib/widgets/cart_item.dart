import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:transparent_image/transparent_image.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 119,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black.withOpacity(0.25),
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: FadeInImage(
                  placeholder: MemoryImage(kTransparentImage),
                  image: const NetworkImage(
                      'https://ipfs.filebase.io/ipfs/QmaqEc8Up8Eia58qDydnxkYwcpvKHhJDZsHsJHjHqvtkVZ'),
                  width: 103,
                  height: 103,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 14),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Grilled Tuna',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                  ),
                  Text(
                    'Porsi : 2.0 serv',
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        fontWeight: FontWeight.w300,
                        fontSize: 10,
                        color: const Color(0xff1e1e1e).withOpacity(0.25)),
                  ),
                  Row(
                    children: [
                      Text(
                        'Rp',
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              fontSize: 12,
                            ),
                      ),
                      Text(
                        '42.000',
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          Row(
            children: const [
              Icon(FeatherIcons.edit),
              SizedBox(width: 8),
              Icon(
                FeatherIcons.trash,
                color: Colors.red,
              ),
            ],
          )
        ],
      ),
    );
  }
}
