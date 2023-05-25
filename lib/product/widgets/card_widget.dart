import 'package:flutter/material.dart';
import 'package:gym_app/product/constants/border_radius_constants.dart';
import 'package:gym_app/product/constants/color_constants.dart';
import 'package:gym_app/product/enums/widget_sizes.dart';

// ignore: must_be_immutable
class CardComponent extends StatelessWidget {
  CardComponent(
      {Key? key,
      required this.cardTitle,
      required this.cardTypeTitle,
      required this.imagePath})
      : super(key: key);
  final String cardTitle;
  final String cardTypeTitle;
  final String imagePath;

  EdgeInsets onlyLeftPadding = const EdgeInsets.only(left: 10);
  EdgeInsets allPadding = const EdgeInsets.all(10);
  EdgeInsets textTopLeftPadding = const EdgeInsets.only(top: 12, left: 5);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: allPadding,
      child: SizedBox(
        width: WidgetSizes.cardWidth.value,
        height: WidgetSizes.cardHeight.value,
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusConstants.cardBorderRadius,
          ),
          child: Stack(
            children: [
              Ink.image(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
                child: InkWell(
                  onTap: () {},
                ),
              ),
              Padding(
                padding: onlyLeftPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      cardTitle,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    SizedBox(
                      height: 50,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const VerticalDivider(
                            color: ColorsConstants.blueColor,
                            thickness: 4,
                            indent: 12,
                            endIndent: 12,
                          ),
                          Padding(
                            padding: textTopLeftPadding,
                            child: Text(
                              cardTypeTitle,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
