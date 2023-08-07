import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sehatin_flutter/providers/navigation_provider.dart';

class BottomAppBarItem extends ConsumerWidget {
  const BottomAppBarItem({
    super.key,
    required this.icon,
    required this.title,
    required this.screen,
  });

  final IconData icon;
  final String title;
  final Widget screen;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        ref.read(navigationProvider.notifier).navigateScreen(screen);
      },
      child: Column(
        children: [
          Icon(
            icon,
            size: 24,
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
