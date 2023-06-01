import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/feature/gender_select_page.dart';
import 'package:gym_app/feature/workout_categories_page.dart';
import 'package:gym_app/product/index.dart';

class AgeHeightWeightPage extends StatelessWidget with NavigatorManager {
  AgeHeightWeightPage({super.key});
  final double subtitleWidth = 250;
  final EdgeInsets onlyTopPadding = const EdgeInsets.only(top: 80);
  final EdgeInsets verticalPadding = const EdgeInsets.symmetric(vertical: 20);
  final EdgeInsets onlyRightPadding = const EdgeInsets.only(right: 20);
  final EdgeInsets floatingButtonPadding = const EdgeInsets.only(bottom: 5);
  final TextEditingController ageControl = TextEditingController();
  final TextEditingController heightControl = TextEditingController();
  final TextEditingController weightControl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    bool showFab = MediaQuery.of(context).viewInsets.bottom != 0;
    CollectionReference user = FirebaseFirestore.instance.collection("users");
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
            NumberInputComponent(
                text: StringConstants.ageInput, control: ageControl),
            NumberInputComponent(
              text: StringConstants.heightInput,
              control: heightControl,
            ),
            NumberInputComponent(
              text: StringConstants.weightInput,
              control: weightControl,
              isLast: true,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: onlyRightPadding,
                  child: ElevatedButtonComponent(
                      widget: const WorkoutCategoriesPage(),
                      buttonWidth: 100,
                      buttonText: StringConstants.nextButtonText,
                      buttonIcon: Icons.play_arrow,
                      method: () async {
                        User.age = int.parse(ageControl.text);
                        User.height = int.parse(heightControl.text);
                        User.weight = int.parse(weightControl.text);
                        Map<String, dynamic> userData = {
                          'gender': User.gender,
                          'age': User.age,
                          'height': User.height,
                          'weight': User.weight,
                        };
                        await user.doc(User.userId).update(userData);
                        // ignore: use_build_context_synchronously
                        navigateToWidget(
                          context,
                          const WorkoutCategoriesPage(),
                        );
                      }),
                )
              ],
            )
          ],
        ))));
  }
}
