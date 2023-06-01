import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/feature/login_page.dart';
import 'package:gym_app/feature/workout_categories_page.dart';
import 'package:gym_app/product/index.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  _ForgetPasswordPage createState() => _ForgetPasswordPage();
}

class _ForgetPasswordPage extends State<ForgetPasswordPage>
    with NavigatorManager {
  final _formKey = GlobalKey<FormState>();

  final double imageHeight = 400;
  final EdgeInsets topLeftPadding = const EdgeInsets.only(top: 130, left: 30);
  final EdgeInsets onlyLeftPadding = const EdgeInsets.only(left: 30, top: 10);
  final EdgeInsets onlyRightPadding = const EdgeInsets.only(right: 32);
  final EdgeInsets buttonPadding =
      const EdgeInsets.symmetric(vertical: 70, horizontal: 20);
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

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
                  Padding(
                    padding: topLeftPadding,
                    child: const TitleComponent(
                        text: StringConstants.ResetPasswordTitle,
                        size: FontSizes.h2,
                        weight: FontWeights.normal),
                  ),
                  Padding(
                    padding: onlyLeftPadding,
                    child: const TitleComponent(
                        text: StringConstants.ResetPasswordSubTitle,
                        size: FontSizes.h3,
                        weight: FontWeights.normal),
                  ),
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                TextInputComponent(
                  type: TextFieldType.email,
                  controller: _emailController,
                ),
                Padding(
                  padding: buttonPadding,
                  child: ElevatedButtonComponent(
                      buttonText: StringConstants.ResetPasswordButton,
                      buttonWidth: 150,
                      buttonIcon: Icons.play_arrow,
                      widget: const WorkoutCategoriesPage(),
                      method: () {
                        resetPassword();
                      }),
                )
              ]),
            ),
          ),
        ],
      ),
    ));
  }

  Future resetPassword() async {
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: _emailController.text.trim());
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Password Reset Email Sent')),
    );
    Navigator.of(context).popUntil((route) => route.isFirst);
    navigateToWidget(context, const LoginPage());
  }
}
