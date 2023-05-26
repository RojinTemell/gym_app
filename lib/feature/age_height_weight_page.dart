import 'package:flutter/material.dart';
import 'package:gym_app/feature/gender_select_page.dart';
import 'package:gym_app/product/index.dart';

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
    bool showFab = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
        floatingActionButton: Visibility(
          visible: !showFab,
          child: Padding(
            padding: floatingButtonPadding,
            child:
                const FloatingActionButtonComponent(widget: GenderSelectPage()),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        body: SingleChildScrollView(
            child: Center(
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
            NumberInputComponent(text: StringConstants.ageInput),
            NumberInputComponent(text: StringConstants.heightInput),
            NumberInputComponent(
              text: StringConstants.weightInput,
              isLast: true,
            ),
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
        ))));
  }
}
