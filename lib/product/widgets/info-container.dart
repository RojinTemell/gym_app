import 'package:flutter/material.dart';
import '../constants/index.dart';

class InfoContainers extends StatelessWidget {
  const InfoContainers({Key? key, required this.iconData, required this.text})
      : super(key: key);
  final IconData iconData;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Container(
        height: 30,
        width: 95,
        decoration: const BoxDecoration(
            color: ColorsConstants.tunaColor,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [Icon(iconData), Text(text)],
        ),
      ),
    );
  }
}
