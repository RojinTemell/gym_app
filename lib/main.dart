import 'package:flutter/material.dart';
import 'package:gym_app/feature/first_page.dart';
import 'package:gym_app/product/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: ColorsConstants.sharkColor,
      ),
      home: const FirstPage(),
    );
  }
}
