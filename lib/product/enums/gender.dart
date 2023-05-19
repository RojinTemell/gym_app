import 'package:flutter/material.dart';

enum Gender {
  female(title: "Female", icon: Icons.female),
  male(title: "Male", icon: Icons.male);

  const Gender({
    required this.title,
    required this.icon,
  });

  final String title;
  final IconData icon;
}
