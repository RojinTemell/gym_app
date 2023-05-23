import 'package:flutter/material.dart';
import 'package:gym_app/product/constants/string_constants.dart';
import 'package:gym_app/product/enums/font_sizes.dart';
import 'package:gym_app/product/enums/font_weight.dart';
import 'package:gym_app/product/widgets/elevated_button_widget.dart';
import 'package:gym_app/product/widgets/select_gender_widget.dart';
import 'package:gym_app/product/widgets/title_widget.dart';

class GenderSelectPage extends StatelessWidget {
  const GenderSelectPage({super.key});
  final double selectorContainerHeight = 440;
  final double selectorContainerWidth = 260;
  final double subtitleWidth = 250;
  final EdgeInsets onlyTopPadding = const EdgeInsets.only(top: 80);
  final EdgeInsets onlyRightPadding = const EdgeInsets.only(right: 20);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          Padding(
            padding: onlyTopPadding,
            child: const TitleComponent(
                text: StringConstants.genderSelectPageTitle,
                size: FontSizes.h4,
                weight: FontWeights.bold),
          ),
          Container(
            padding: onlyTopPadding / 4,
            width: subtitleWidth,
            child: const TitleComponent(
                text: StringConstants.genderSelectPageSubTitle,
                size: FontSizes.h6,
                weight: FontWeights.normal),
          ),
          SizedBox(
            width: selectorContainerWidth,
            height: selectorContainerHeight,
            child: GenderSelector(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: onlyRightPadding,
                child: const ElevatedButtonComponent(
                  buttonWidth: 100,
                  buttonText: StringConstants.nextButtonText,
                  buttonIcon: Icons.play_arrow,
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
