import 'package:flutter/material.dart';
import 'package:gym_app/product/index.dart';

class TextButtonComponent extends StatelessWidget with NavigatorManager {
  TextButtonComponent(
      {required this.buttonText,
      required this.widget,
      required this.isActive,
      Key? key})
      : super(key: key);
  final String buttonText;
  final Widget widget;
  final bool isActive;
  final EdgeInsets margin = const EdgeInsets.all(20);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin,
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
          color: ColorsConstants.blueColor,
          width: isActive ? 3 : 0,
        ))),
        child: TextButton(
            onPressed: () {
              navigateToWidget(context, widget);
            },
            style: TextButton.styleFrom(
              foregroundColor: ColorsConstants.whiteColor,
            ),
            child: Text(
              buttonText,
            )));
  }
}
