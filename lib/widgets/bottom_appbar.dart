import 'package:flutter/material.dart';
import 'package:sehatin_flutter/data/bottomappbar_data.dart';
import 'package:sehatin_flutter/widgets/bottom_appbar_item.dart';
import 'package:sehatin_flutter/models/navigation_model.dart';

class CustomBottomAppBar extends StatefulWidget {
  const CustomBottomAppBar({
    super.key,
    required this.bottomAppbar,
  });

  final List<Navigation> bottomAppbar;

  @override
  State<CustomBottomAppBar> createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 63,
      padding: const EdgeInsets.only(left: 24, right: 24, top: 12),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
        color: const Color(0xffF4F4F9),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for (final screen in navigationScreenData)
            BottomAppBarItem(
              icon: screen.icon,
              title: screen.title,
              screen: screen.screen,
            )
        ],
      ),
    );
  }
}
