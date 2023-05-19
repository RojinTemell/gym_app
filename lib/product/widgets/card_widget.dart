import 'package:flutter/material.dart';
import 'package:gym_app/product/constants/color_constants.dart';
import 'package:gym_app/product/enums/widget_sizes.dart';

class CardComponent extends StatelessWidget {
  CardComponent(
      {Key? key,
      required this.cardTitle,
      required this.cardSubtitle,
      required this.imagePath})
      : super(key: key);
  final String cardTitle;
  final String cardSubtitle;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: SizedBox(
          width: WidgetSizes.cardWidth.value,
          height: WidgetSizes.cardHeight.value,
          child: Card(
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: 82,
                      height: WidgetSizes.cardHeight.value,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.horizontal(
                            left: Radius.circular(12)),
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.cover,
                        ),
                      )),
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 225,
                            child: Text(
                              cardTitle,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: const TextStyle(
                                color: ColorsConstants.white_Color,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 3),
                            child: Text(
                              cardSubtitle,
                              style: const TextStyle(
                                color: ColorsConstants.blue_Color,
                                fontSize: 13,
                              ),
                            ),
                          )
                        ],
                      ))
                ],
              )),
        ));
  }
}
