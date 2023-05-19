import 'package:flutter/material.dart';
import 'package:gym_app/product/constants/color_constants.dart';
import 'package:gym_app/product/enums/gender.dart';

class genderButtonComponent extends StatelessWidget {
  genderButtonComponent({Key? key, required this.gender}) : super(key: key);
  final Gender gender;
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color:
          isSelected ? ColorsConstants.blue_Color : ColorsConstants.grey_Color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80)),
      child: Container(
        height: 140,
        width: 140,
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            Icon(
              gender.icon,
              color: Colors.black,
              size: 60,
              weight: 800.0,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              gender.title,
              style: TextStyle(
                  color: isSelected ? Colors.black : Colors.white,
                  fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
