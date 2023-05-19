import 'package:flutter/material.dart';
import 'package:gym_app/product/constants/color_constants.dart';

class elevatedButtonComponent extends StatelessWidget {
  elevatedButtonComponent(
      {required this.buttonWidth,
      required this.buttonText,
      this.buttonIcon,
      Key? key})
      : super(key: key);
  final double buttonWidth;
  final String buttonText;
  final IconData? buttonIcon;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        child: SizedBox(
            width: buttonWidth,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  buttonText,
                  style: TextStyle(
                    color: ColorsConstants.black_color,
                  ),
                ),
                buttonIcon != null
                    ? Icon(
                        buttonIcon,
                        color: ColorsConstants.black_color,
                      )
                    : Text("")
              ],
            )),
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          backgroundColor: ColorsConstants.blue_Color,
        ));
  }
}
