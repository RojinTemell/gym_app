import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:gym_app/feature/gender_select_page.dart';
import 'package:gym_app/feature/login_page.dart';
import 'package:gym_app/product/index.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignUpPage createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUpPage> with NavigatorManager {
  final _formKey = GlobalKey<FormState>();

  final double imageHeight = 300;
  final EdgeInsets topLeftPadding = const EdgeInsets.only(top: 40, left: 30);
  final EdgeInsets onlyLeftPadding = const EdgeInsets.only(left: 30);
  final EdgeInsets onlyRightPadding = const EdgeInsets.only(right: 32);
  final EdgeInsets topRightPadding = const EdgeInsets.only(right: 32, top: 60);
  final EdgeInsets subTitlePadding =
      const EdgeInsets.only(left: 30, top: 10, right: 150);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordAgainController = TextEditingController();

  CollectionReference user = FirebaseFirestore.instance.collection("users");

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
                        ImageEnums.signUpPageImage.toJpg,
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
                        isActive: false,
                      ),
                      TextButtonComponent(
                        buttonText: StringConstants.signupButtonText,
                        widget: const SignUpPage(),
                        isActive: true,
                      ),
                    ],
                  ),
                  Padding(
                      padding: topLeftPadding,
                      child: Row(
                        children: const [
                          TitleComponent(
                              text: StringConstants.signUpPageTitle1,
                              size: FontSizes.h1,
                              weight: FontWeights.normal),
                          TitleComponent(
                              text: StringConstants.signUpPageTitle2,
                              size: FontSizes.h1,
                              weight: FontWeights.semiBold),
                        ],
                      )),
                  Padding(
                    padding: subTitlePadding,
                    child: const TitleComponent(
                      text: StringConstants.signUpPageSubTitle,
                      size: FontSizes.h6,
                      weight: FontWeights.normal,
                      align: TextAlign.start,
                    ),
                  ),
                ],
              )
            ],
          ),
          Form(
            key: _formKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              TextInputComponent(
                type: TextFieldType.email,
                controller: emailController,
              ),
              TextInputComponent(
                type: TextFieldType.password,
                controller: passwordController,
              ),
              TextInputComponent(
                type: TextFieldType.passwordAgain,
                controller: passwordAgainController,
                isLast: true,
              ),
              Padding(
                padding: topRightPadding,
                child: ElevatedButtonComponent(
                    buttonText: StringConstants.signupButtonText,
                    buttonWidth: 100,
                    buttonIcon: Icons.play_arrow,
                    widget: const GenderSelectPage(),
                    method: () async {
                      auth.FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text)
                          .then((value) async {
                        Map<String, dynamic> userData = {
                          'userId': value.user?.uid,
                        };
                        await user.doc(value.user?.uid).set(userData);
                        User.userId = value.user!.uid;
                        navigateToWidget(context, const GenderSelectPage());
                      }).onError((error, stackTrace) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content:
                                  Text(StringConstants.passwordAgainError)),
                        );
                      });
                    }),
              )
            ]),
          ),
        ],
      ),
    ));
  }
}


/* if (_formKey.currentState!.validate() &&
                          passwordAgainController.text ==
                              passwordController.text) {
                        Map<String, dynamic> userData = {
                          'email': emailController.text,
                          'password': passwordController.text,
                        };
                        await user.doc(emailController.text).set(userData);
                        User.email = emailController.text;
                        // ignore: use_build_context_synchronously
                        navigateToWidget(context, const GenderSelectPage());
                      } else if (passwordAgainController.text !=
                          passwordController.text) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content:
                                  Text(StringConstants.passwordAgainError)),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text(StringConstants.loginErrorText)),
                        );
                      } */