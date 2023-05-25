import 'package:flutter/material.dart';
import 'package:gym_app/product/enums/text_field_type.dart';

class TextInputComponent extends StatelessWidget {
  TextInputComponent({Key? key, required this.type}) : super(key: key);
  final TextFieldType type;
  final EdgeInsets padding =
      const EdgeInsets.symmetric(horizontal: 32, vertical: 5);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Padding(
      padding: padding,
      child: TextFormField(
        controller: controller,
        obscureText: type == TextFieldType.password,
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
