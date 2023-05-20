import 'package:flutter/material.dart';
import 'package:gym_app/product/constants/color_constants.dart';

class FloatingActionButtonComponent extends StatelessWidget {
  const FloatingActionButtonComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.arrow_back),
      backgroundColor: ColorsConstants.tuna_Color,
    );
  }
}
