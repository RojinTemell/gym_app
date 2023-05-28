import 'package:flutter/material.dart';
import 'package:gym_app/feature/workout_plan_detail_page.dart';
import 'package:gym_app/product/index.dart';

// ignore: must_be_immutable
class CardComponent extends StatelessWidget with NavigatorManager {
  CardComponent(
      {Key? key,
      required this.cardTitle,
      required this.cardTypeTitle,
      required this.imagePath,
      required this.widget})
      : super(key: key);
  final String cardTitle;
  final Widget widget;
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
            child: InkWell(
              onTap: () {
                navigateToWidget(context, const WorkoutDetailPlanPage());
              },
              child: Stack(
                children: [
                  ImageShadowComponent(
                    widget: Image(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                      width: WidgetSizes.cardWidth.value,
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
          )),
    );
  }
}
