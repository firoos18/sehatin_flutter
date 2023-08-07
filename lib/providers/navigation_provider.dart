import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sehatin_flutter/screens/home_screen.dart';

class NavigationNotifier extends StateNotifier<Widget> {
  NavigationNotifier() : super(const HomeScreen());

  void navigateScreen(Widget screen) {
    state = screen;
  }
}

final navigationProvider = StateNotifierProvider<NavigationNotifier, Widget>(
  (ref) => NavigationNotifier(),
);
