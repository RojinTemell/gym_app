import 'package:flutter/material.dart';
import 'package:gym_app/product/index.dart';

class SecondPage1 extends StatelessWidget {
  const SecondPage1({super.key});
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
                ImageEnums.secondPage1Image.toJpg,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Padding(
          padding: onlyTopPadding,
          child: const TitleComponent(
              text: StringConstants.secondPage1Title,
              size: FontSizes.h3,
              weight: FontWeights.normal),
        ),
        const TitleComponent(
            text: StringConstants.secondPage1SubTitle,
            size: FontSizes.h3,
            weight: FontWeights.bold),
      ],
    ));
  }
}
