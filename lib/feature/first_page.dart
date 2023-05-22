import 'package:flutter/material.dart';
import 'package:gym_app/product/constants/color_constants.dart';
import 'package:gym_app/product/constants/string_constants.dart';
import 'package:gym_app/product/enums/font_sizes.dart';
import 'package:gym_app/product/enums/font_weight.dart';
import 'package:gym_app/product/enums/image_enums.dart';
import 'package:gym_app/product/widgets/title_widget.dart';
import 'secondPages/second_page1.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SecondPage1()),
      );
    });
  }

  final EdgeInsets onlyTopPadding = const EdgeInsets.only(top: 10);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ImageEnums.firstPageImage.toJpg,
              width: 120,
              height: 120,
              color: ColorsConstants.whiteColor,
            ),
            Padding(
              padding: onlyTopPadding,
              child: const TitleComponent(
                text: StringConstants.firstPageTitle,
                size: FontSizes.firstPageTitle,
                weight: FontWeights.bold,
                color: ColorsConstants.blueColor,
              ),
            ),
            const TitleComponent(
              text: StringConstants.firstPageSubTitle,
              size: FontSizes.firstPageSubTitle,
              weight: FontWeights.semiBold,
              color: ColorsConstants.blueColor,
            ),
          ],
        ),
      ),
    );
  }
}
