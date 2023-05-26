import 'package:flutter/material.dart';
import 'package:gym_app/product/index.dart';
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
          child: ImageShadowComponent(
            widget: SizedBox(
              width: double.infinity,
              height: imageHeight,
              child: Image.asset(
                ImageEnums.secondPage3Image.toJpg,
                fit: BoxFit.cover,
              ),
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
