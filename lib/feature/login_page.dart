import 'package:flutter/material.dart';
import 'package:gym_app/feature/sign_up_page.dart';
import 'package:gym_app/feature/workout_categories_page.dart';
import 'package:gym_app/product/index.dart';

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
              ClipPath(
                  clipper: BackgroundClipper(),
                  child: ImageShadowComponent(
                    widget: SizedBox(
                      width: double.infinity,
                      height: imageHeight,
                      child: Image.asset(
                        ImageEnums.loginPageImage.toJpg,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      TextButtonComponent(
                        buttonText: StringConstants.loginButtonText,
                        widget: const LoginPage(),
                        isActive: true,
                      ),
                      TextButtonComponent(
                        buttonText: StringConstants.signupButtonText,
                        widget: const SignUpPage(),
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
                    widget: const WorkoutCategoriesPage(),
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
