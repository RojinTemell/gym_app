import 'package:flutter/material.dart';
import 'package:gym_app/product/constants/color_constants.dart';
import 'package:gym_app/product/enums/font_sizes.dart';
import 'package:gym_app/product/mixins/navigatorManager.dart';

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
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20),
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
