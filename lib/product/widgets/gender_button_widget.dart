import 'package:flutter/material.dart';
import 'package:gym_app/product/constants/color_constants.dart';
import 'package:gym_app/product/enums/font_sizes.dart';
import 'package:gym_app/product/enums/gender.dart';
import 'package:gym_app/product/enums/widget_sizes.dart';

class GenderButtonComponent extends StatelessWidget {
  GenderButtonComponent({Key? key, required this.gender}) : super(key: key);
  final Gender gender;
  bool isSelected = false;
  EdgeInsets onlyTop = const EdgeInsets.only(top: 20.0);
  final double iconSize = 60;

  @override
  Widget build(BuildContext context) {
    return Card(
      color:
          isSelected ? ColorsConstants.blueColor : ColorsConstants.sharkColor,
      shape: const CircleBorder(),
      child: Container(
        height: WidgetSizes.genderButtonSize.value,
        width: WidgetSizes.genderButtonSize.value,
        alignment: Alignment.center,
        padding: onlyTop,
        child: Column(
          children: [
            Icon(
              gender.icon,
              color: isSelected
                  ? ColorsConstants.blackcolor
                  : ColorsConstants.whiteColor,
              size: iconSize,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              gender.title,
              style: TextStyle(
                  color: isSelected
                      ? ColorsConstants.blackcolor
                      : ColorsConstants.whiteColor,
                  fontSize: FontSizes.genderButtonLabel.value),
            )
          ],
        ),
      ),
    );
  }
}
