import 'package:flutter/material.dart';
import 'package:gym_app/product/index.dart';

// ignore: must_be_immutable
class NumberInputComponent extends StatelessWidget {
  NumberInputComponent({Key? key, required this.text, this.isLast = false})
      : super(key: key);
  final String text;
  bool isLast;
  final double gap = 10;
  final EdgeInsets onlyBottomMargin = const EdgeInsets.only(bottom: 20);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: WidgetSizes.numberInputHeight.value,
        margin: onlyBottomMargin,
        width: WidgetSizes.numberInputWidth.value,
        decoration: BoxDecoration(
            color: ColorsConstants.tunaColor,
            borderRadius: BorderRadiusConstants.numberInputBorderRadius),
        child: Column(
          children: [
            SizedBox(
              height: gap,
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: FontSizes.h5.value,
              ),
            ),
            TextField(
              textInputAction:
                  isLast ? TextInputAction.done : TextInputAction.next,
              keyboardType: TextInputType.number,
              keyboardAppearance: Brightness.dark,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: FontSizes.h1.value,
              ),
              decoration: const InputDecoration(
                  filled: true,
                  fillColor: ColorsConstants.tunaColor,
                  border: OutlineInputBorder(borderSide: BorderSide.none)),
            ),
          ],
        ));
  }
}
