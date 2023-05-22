import 'package:flutter/material.dart';
import 'package:gym_app/product/constants/color_constants.dart';

class FloatingActionButtonComponent extends StatelessWidget {
  const FloatingActionButtonComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: ColorsConstants.tunaColor,
      child: const Icon(
        Icons.arrow_back,
        color: ColorsConstants.whiteColor,
      ),
    );
  }
}
