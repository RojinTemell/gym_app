import 'package:flutter/material.dart';
import 'package:gym_app/product/index.dart';

class GenderSelector extends StatefulWidget {
  const GenderSelector({super.key});

  @override
  SelectGender createState() => SelectGender();
}

class SelectGender extends State<GenderSelector> {
  List genders = [Gender.female, Gender.male];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(40),
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            splashColor: ColorsConstants.sharkColor,
            onTap: () {
              setState(() => selectedIndex = index);
              User.gender = index == 0;
            },
            child: GenderButtonComponent(
                gender: genders[index], isSelected: selectedIndex == index),
          );
        });
  }
}
