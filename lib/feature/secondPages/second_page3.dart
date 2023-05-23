import 'package:flutter/material.dart';
import 'package:gym_app/product/constants/string_constants.dart';
import 'package:gym_app/product/enums/font_sizes.dart';
import 'package:gym_app/product/enums/font_weight.dart';
import 'package:gym_app/product/enums/image_enums.dart';
import 'package:gym_app/product/widgets/elevated_button_widget.dart';
import 'package:gym_app/product/widgets/title_widget.dart';

import '../../product/constants/clipper_constants.dart';
import '../gender_select_page.dart';

class SecondPage3 extends StatelessWidget {
  const SecondPage3({super.key});
  final double imageHeight = 400;
  final EdgeInsets onlyTopPadding = const EdgeInsets.only(top: 40);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        ClipPath(
          clipper: BackgroundClipper(),
          child: SizedBox(
            width: double.infinity,
            height: imageHeight,
            child: Image.asset(
              ImageEnums.secondPage3Image.toJpg,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: onlyTopPadding,
          child: const TitleComponent(
              text: StringConstants.secondPage3Title,
              size: FontSizes.h3,
              weight: FontWeights.normal),
        ),
        const TitleComponent(
            text: StringConstants.secondPage3SubTitle,
            size: FontSizes.h3,
            weight: FontWeights.bold),
        Padding(
          padding: onlyTopPadding,
          child: ElevatedButtonComponent(
            widget: const GenderSelectPage(),
            buttonWidth: 185,
            buttonText: StringConstants.secondPage3ButtonText,
            buttonIcon: Icons.play_arrow,
          ),
        )
      ],
    ));
  }
}
