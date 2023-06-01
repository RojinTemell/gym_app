import 'package:flutter/material.dart';
import 'package:gym_app/product/index.dart';
import 'package:url_launcher/url_launcher.dart';

class VideoCardComponent extends StatelessWidget {
  const VideoCardComponent(
      {Key? key,
      required this.cardTitle,
      required this.cardSubtitle,
      required this.imagePath,
      required this.cardUrl})
      : super(key: key);
  final String cardTitle;
  final String cardSubtitle;
  final String imagePath;
  final String cardUrl;

  Future<void> _launchURL(String url) async {
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Could not launch url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: GestureDetector(
          onTap: () {
            _launchURL(cardUrl);
          },
          child: SizedBox(
            width: WidgetSizes.videoCardWidth.value,
            height: WidgetSizes.videoCardHeight.value,
            child: Card(
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusConstants.videoCardBorderRadius),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: WidgetSizes.videoCardImageWidth.value,
                        height: WidgetSizes.videoCardHeight.value,
                        child: ClipRRect(
                          borderRadius: BorderRadius.horizontal(
                              left: BorderRadiusConstants.videoCardRadius),
                          child: Image.network(
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
                              width: WidgetSizes.videoCardWidth.value -
                                  WidgetSizes.videoCardImageWidth.value -
                                  20,
                              child: Text(
                                cardTitle,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                  color: ColorsConstants.whiteColor,
                                  fontSize: FontSizes.videoCardTitle.value,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 3),
                              child: Text(
                                cardSubtitle,
                                style: TextStyle(
                                  color: ColorsConstants.blueColor,
                                  fontSize: FontSizes.videoCardTitle.value,
                                ),
                              ),
                            )
                          ],
                        ))
                  ],
                )),
          )),
    );
  }
}
