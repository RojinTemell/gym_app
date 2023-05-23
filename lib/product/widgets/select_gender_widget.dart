import 'package:flutter/material.dart';

import '../constants/color_constants.dart';
import '../enums/gender.dart';
import 'gender_button_widget.dart';

class GenderSelector extends StatefulWidget {
  const GenderSelector({super.key});

  @override
  SelectGender createState() => SelectGender();
}

class SelectGender extends State<GenderSelector> {
  List genders = [Gender.female, Gender.male];
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(40),
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            splashColor: ColorsConstants.sharkColor,
            onTap: () => setState(() => selectedIndex = index),
            child: GenderButtonComponent(
                gender: genders[index], isSelected: selectedIndex == index),
          );
        });
  }
}
