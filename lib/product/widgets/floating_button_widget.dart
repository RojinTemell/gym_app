import 'package:flutter/material.dart';
import 'package:gym_app/product/index.dart';

class FloatingActionButtonComponent extends StatelessWidget
    with NavigatorManager {
  const FloatingActionButtonComponent({Key? key, required this.widget})
      : super(key: key);
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        navigateToWidget(context, widget);
      },
      backgroundColor: ColorsConstants.tunaColor,
      child: const Icon(
        Icons.arrow_back,
        color: ColorsConstants.whiteColor,
      ),
    );
  }
}
