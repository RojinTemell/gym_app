import 'package:flutter/material.dart';
import 'package:gym_app/feature/first_page.dart';
import 'package:gym_app/feature/gender_select_page.dart';
import 'package:gym_app/product/constants/string_constants.dart';
import 'package:gym_app/product/enums/font_sizes.dart';
import 'package:gym_app/product/enums/font_weight.dart';
import 'package:gym_app/product/widgets/elevated_button_widget.dart';
import 'package:gym_app/product/widgets/floating_button_widget.dart';
import 'package:gym_app/product/widgets/number_input_widget.dart';
import 'package:gym_app/product/widgets/title_widget.dart';

import 'login_page.dart';

class AgeHeightWeightPage extends StatelessWidget {
  const AgeHeightWeightPage({super.key});
  final double subtitleWidth = 250;
  final EdgeInsets onlyTopPadding = const EdgeInsets.only(top: 80);
  final EdgeInsets verticalPadding = const EdgeInsets.symmetric(vertical: 20);
  final EdgeInsets onlyRightPadding = const EdgeInsets.only(right: 20);
  final EdgeInsets floatingButtonPadding = const EdgeInsets.only(bottom: 5);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Padding(
          padding: floatingButtonPadding,
          child:
              const FloatingActionButtonComponent(widget: GenderSelectPage()),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: [
              Padding(
                  padding: onlyTopPadding,
                  child: SizedBox(
                    width: subtitleWidth + 150,
                    child: const TitleComponent(
                        text: StringConstants.ageHeightWeightPageTitle,
                        size: FontSizes.h4,
                        weight: FontWeights.bold),
                  )),
              Container(
                padding: verticalPadding,
                width: subtitleWidth,
                child: const TitleComponent(
                    text: StringConstants.ageHeightWeightPageSubTitle,
                    size: FontSizes.h6,
                    weight: FontWeights.normal),
              ),
              const NumberInputComponent(text: StringConstants.ageInput),
              const NumberInputComponent(text: StringConstants.heightInput),
              const NumberInputComponent(text: StringConstants.weightInput),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: onlyRightPadding,
                    child: ElevatedButtonComponent(
                      widget: const LoginPage(),
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
