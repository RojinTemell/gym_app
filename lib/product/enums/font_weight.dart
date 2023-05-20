import 'package:flutter/material.dart';

enum FontWeights {
  bold(FontWeight.w800),
  semiBold(FontWeight.w700),
  normal(FontWeight.w400);

  final FontWeight value;

  const FontWeights(this.value);
}
