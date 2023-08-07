import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sehatin_flutter/providers/navigation_provider.dart';
import 'package:sehatin_flutter/screens/cart_screen.dart';
import 'package:sehatin_flutter/screens/history_screen.dart';
import 'package:sehatin_flutter/screens/home_screen.dart';
import 'package:sehatin_flutter/widgets/bottom_appbar.dart';
import 'package:sehatin_flutter/data/bottomappbar_data.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  final appbarData = navigationScreenData;

  @override
  Widget build(BuildContext context) {
    final Widget activeScreen = ref.watch(navigationProvider);

    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leadingWidth: 64,
        leading: const Padding(
          padding: EdgeInsets.only(left: 16),
          child: CircleAvatar(
            backgroundImage: AssetImage('lib/assets/haerin.jpg'),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                FeatherIcons.bell,
                size: 32,
              ),
            ),
          )
        ],
      ),
      body: activeScreen,
      bottomNavigationBar: CustomBottomAppBar(
        bottomAppbar: appbarData,
      ),
    );
  }
}
