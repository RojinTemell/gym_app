import 'package:flutter/material.dart';
import 'package:gym_app/product/index.dart';

class TitleComponent extends StatelessWidget {
  const TitleComponent(
      {Key? key,
      required this.text,
      required this.size,
      required this.weight,
      this.color})
      : super(key: key);
  final String text;
  final FontSizes size;
  final FontWeights weight;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'IntegralCF',
        fontWeight: weight.value,
        fontSize: size.value,
        color: color ?? ColorsConstants.whiteColor,
      ),
    );
  }
}
