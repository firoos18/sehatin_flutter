import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:sehatin_flutter/models/navigation_model.dart';
import 'package:sehatin_flutter/screens/cart_screen.dart';
import 'package:sehatin_flutter/screens/history_screen.dart';
import 'package:sehatin_flutter/screens/home_screen.dart';

final navigationScreenData = [
  Navigation(
    icon: FeatherIcons.home,
    title: 'Beranda',
    screen: const HomeScreen(),
  ),
  Navigation(
    icon: FeatherIcons.shoppingCart,
    title: 'Keranjang',
    screen: const CartScreen(),
  ),
  Navigation(
    icon: FeatherIcons.clock,
    title: 'Riwayat',
    screen: const HistoryScreen(),
  ),
];
