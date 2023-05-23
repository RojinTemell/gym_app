import 'package:flutter/material.dart';
import 'package:gym_app/product/constants/border_radius_constants.dart';
import 'package:gym_app/product/constants/color_constants.dart';
import 'package:gym_app/product/enums/font_sizes.dart';
import 'package:gym_app/product/enums/widget_sizes.dart';
import 'package:gym_app/product/mixins/navigatorManager.dart';

class ElevatedButtonComponent extends StatelessWidget with NavigatorManager {
  ElevatedButtonComponent(
      {required this.buttonWidth,
      required this.buttonText,
      required this.widget,
      this.buttonIcon,
      Key? key})
      : super(key: key);
  final double buttonWidth;
  final String buttonText;
  final IconData? buttonIcon;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          navigateToWidget(context, widget);
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
