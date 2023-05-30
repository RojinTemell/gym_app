import 'package:flutter/material.dart';
import 'package:gym_app/product/index.dart';

class TextInputComponent extends StatelessWidget {
  TextInputComponent(
      {Key? key,
      required this.type,
      this.isLast = false,
      required this.controller})
      : super(key: key);
  final TextFieldType type;
  bool isLast;
  final EdgeInsets padding =
      const EdgeInsets.symmetric(horizontal: 32, vertical: 5);
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextFormField(
        textInputAction: isLast ? TextInputAction.done : TextInputAction.next,
        controller: controller,
        obscureText: type == TextFieldType.password ||
            type == TextFieldType.passwordAgain,
        decoration: InputDecoration(labelText: type.value),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your ${type.value.toLowerCase()}';
          }
          return null;
        },
      ),
    );
  }
}
