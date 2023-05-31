import 'package:flutter/material.dart';
import 'package:gym_app/feature/age_height_weight_page.dart';
import 'package:gym_app/product/index.dart';

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
            child: const GenderSelector(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: onlyRightPadding,
                child: ElevatedButtonComponent(
                  widget: AgeHeightWeightPage(),
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
