import 'package:flutter/material.dart';
import 'package:gym_app/product/enums/font_sizes.dart';
import 'package:gym_app/product/enums/font_weight.dart';

class TitleComponent extends StatelessWidget {
  TitleComponent(
      {Key? key, required this.text, required this.size, required this.weight})
      : super(key: key);
  final String text;
  final FontSizes size;
  final FontWeights weight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'IntegralCF',
        fontWeight: weight.value,
        fontSize: size.value,
      ),
    );
  }
}
