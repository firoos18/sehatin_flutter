import 'package:flutter/material.dart';

class PreferenceItemEntity {
  final IconData icon;
  final String title;
  final Function() action;
  final bool isLogout;

  PreferenceItemEntity({
    required this.icon,
    required this.title,
    required this.action,
    required this.isLogout,
  });
}
