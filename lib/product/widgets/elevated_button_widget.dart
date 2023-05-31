import 'package:flutter/material.dart';
import 'package:gym_app/product/index.dart';

class ElevatedButtonComponent extends StatelessWidget with NavigatorManager {
  ElevatedButtonComponent(
      {required this.buttonWidth,
      required this.buttonText,
      required this.widget,
      this.buttonIcon,
      this.method,
      Key? key})
      : super(key: key);
  final double buttonWidth;
  final String buttonText;
  final IconData? buttonIcon;
  final Widget widget;
  final Function? method;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          if (method != null) {
            method!();
          } else {
            navigateToWidget(context, widget);
          }
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusConstants.elevatedButtonBorderRadius),
          backgroundColor: ColorsConstants.blueColor,
        ),
        child: SizedBox(
            width: buttonWidth,
            height: WidgetSizes.elevatedButtonHeight.value,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  buttonText,
                  style: TextStyle(
                    color: ColorsConstants.blackcolor,
                    fontSize: FontSizes.h5.value,
                  ),
                ),
                buttonIcon != null
                    ? Icon(
                        buttonIcon,
                        color: ColorsConstants.blackcolor,
                      )
                    : const Text("")
              ],
            )));
  }
}
