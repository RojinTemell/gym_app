import 'package:flutter/material.dart';
import 'package:gym_app/feature/first_page.dart';
import 'package:gym_app/product/constants/string_constants.dart';
import 'package:gym_app/product/enums/font_sizes.dart';
import 'package:gym_app/product/enums/font_weight.dart';
import 'package:gym_app/product/enums/image_enums.dart';
import 'package:gym_app/product/enums/text_field_type.dart';
import 'package:gym_app/product/widgets/text_button_widget.dart';
import 'package:gym_app/product/widgets/text_input_widget.dart';
import 'package:gym_app/product/widgets/title_widget.dart';

import '../../product/constants/clipper_constants.dart';
import '../product/widgets/elevated_button_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final double imageHeight = 400;
  final EdgeInsets topLeftPadding = const EdgeInsets.only(top: 130, left: 30);
  final EdgeInsets onlyLeftPadding = const EdgeInsets.only(left: 30);
  final EdgeInsets onlyRightPadding = const EdgeInsets.only(right: 32);
  final EdgeInsets topRightPadding = const EdgeInsets.only(right: 32, top: 20);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              ShaderMask(
                shaderCallback: (rect) {
                  return const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(154, 0, 0, 0),
                      Color.fromARGB(32, 0, 0, 0)
                    ],
                  ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                },
                blendMode: BlendMode.dstIn,
                child: ClipPath(
                  clipper: BackgroundClipper(),
                  child: SizedBox(
                    width: double.infinity,
                    height: imageHeight,
                    child: Image.asset(
                      ImageEnums.loginPageImage.toJpg,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      TextButtonComponent(
                        buttonText: StringConstants.loginButtonText,
                        widget: widget,
                        isActive: true,
                      ),
                      TextButtonComponent(
                        buttonText: StringConstants.signupButtonText,
                        widget: widget,
                        isActive: false,
                      ),
                    ],
                  ),
                  Padding(
                    padding: topLeftPadding,
                    child: const TitleComponent(
                        text: StringConstants.loginPageTitle,
                        size: FontSizes.h1,
                        weight: FontWeights.normal),
                  ),
                  Padding(
                    padding: onlyLeftPadding,
                    child: const TitleComponent(
                        text: StringConstants.loginPageSubTitle,
                        size: FontSizes.h1,
                        weight: FontWeights.bold),
                  ),
                ],
              )
            ],
          ),
          Form(
            key: _formKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              TextInputComponent(type: TextFieldType.email),
              TextInputComponent(
                type: TextFieldType.password,
                isLast: true,
              ),
              Padding(
                  padding: onlyRightPadding,
                  child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        StringConstants.forgetPasswordButtonText,
                      ))),
              Padding(
                padding: topRightPadding,
                child: ElevatedButtonComponent(
                    buttonText: StringConstants.loginButtonText,
                    buttonWidth: 100,
                    buttonIcon: Icons.play_arrow,
                    widget: const FirstPage(),
                    method: () {
                      if (_formKey.currentState!.validate()) {
                        return true;
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text(StringConstants.loginErrorText)),
                        );
                        return false;
                      }
                    }),
              )
            ]),
          ),
        ],
      ),
    ));
  }
}
