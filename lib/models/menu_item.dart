import 'package:flutter/material.dart';

class MenuItem {
  final String name;
  final IconData icon;

  final Widget? trailing;

  MenuItem(
    this.name,
    this.icon, {
    this.trailing,
  });
}
