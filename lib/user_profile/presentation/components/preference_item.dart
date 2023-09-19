import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:sehatin_flutter/user_profile/domain/entities/preference_item_entity.dart';

class PreferenceItem extends StatelessWidget {
  final PreferenceItemEntity item;

  const PreferenceItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(
            color: item.isLogout
                ? Colors.red.shade400
                : const Color(0xff1E1E1E).withOpacity(0.3)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                item.icon,
                color: item.isLogout
                    ? Colors.red.shade400
                    : const Color(0xff1E1E1E),
              ),
              const SizedBox(width: 8),
              Text(
                item.title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: item.isLogout
                      ? Colors.red.shade400
                      : const Color(0xff1E1E1E),
                ),
              ),
            ],
          ),
          InkWell(
            onTap: item.action,
            radius: 0,
            child: Icon(
              FeatherIcons.chevronRight,
              color:
                  item.isLogout ? Colors.red.shade400 : const Color(0xff1E1E1E),
            ),
          ),
        ],
      ),
    );
  }
}
