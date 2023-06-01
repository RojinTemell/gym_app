import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/feature/workout_categories_page.dart';
import 'package:gym_app/product/index.dart';

class WorkoutDetailPlanPage extends StatefulWidget {
  final int cardId;

  const WorkoutDetailPlanPage({super.key, required this.cardId});

  @override
  State<WorkoutDetailPlanPage> createState() =>
      _WorkoutDetailPlanPageState(cardId);
}

class _WorkoutDetailPlanPageState extends State<WorkoutDetailPlanPage>
    with NavigatorManager {
  final int cardId;
  _WorkoutDetailPlanPageState(this.cardId);

  @override
  Widget build(BuildContext context) {
    PagePadding pagePadding = PagePadding();
    PageHeights pageHeights = PageHeights();
    Radius radius30 = const Radius.circular(30.0);

    List<Map> VideoCards = [];

    Future getCards() async {
      await FirebaseFirestore.instance
          .collection('videos')
          .get()
          .then((snapshot) => snapshot.docs.forEach((document) {
                print(document.data()['cardId']);
                if (document.data()['cardId'] == cardId) {
                  VideoCards.add(document.data());
                }
              }));
    }

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                ImageEnums.workoutPlanDetailPage.toJpg,
                height: pageHeights.imageHeight,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: pagePadding.padding30,
                child: FloatingActionButton(
                  onPressed: () {
                    navigateToWidget(context, const WorkoutCategoriesPage());
                  },
                  backgroundColor: ColorsConstants.greyColor,
                  child: const Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: ColorsConstants.whiteColor,
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    height: pageHeights.randomContainerHeight,
                    decoration: BoxDecoration(
                      color: ColorsConstants.sharkColor,
                      borderRadius: BorderRadius.only(
                        topLeft: radius30,
                        topRight: radius30,
                      ),
                    ),
                    child: Padding(
                      padding: pagePadding.topPadding,
                      child: const TitleComponent(
                        text: StringConstants.workoutDetailPlanTitle,
                        size: FontSizes.videoCardTitle,
                        weight: FontWeights.semiBold,
                        color: ColorsConstants.blueColor,
                      ),
                    ),
                  )),
            ],
          ),
          Row(
            children: const [
              InfoContainers(
                iconData: Icons.play_circle,
                text: "60 min",
              ),
              InfoContainers(
                iconData: Icons.local_fire_department,
                text: "350 Cal",
              ),
            ],
          ),
          Padding(
            padding: pagePadding.topPadding,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: pagePadding.rightPadding,
                child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: pageHeights.sizedBoxHeight,
                    child: Padding(
                      padding: pagePadding.leftPadding,
                      child: const Text(
                          StringConstants.workoutDetailPlanDescription),
                    )),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: getCards(),
              builder: (context, snapshot) {
                return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: VideoCards.length,
                    itemBuilder: (context, index) {
                      return VideoCardComponent(
                        cardTitle: VideoCards[index]['videoTitle'],
                        cardSubtitle: VideoCards[index]['videoTime'],
                        cardUrl: VideoCards[index]['videoUrl'],
                        imagePath: VideoCards[index]['videoImage'],
                      );
                    });
              },
            ),
          )
        ],
      ),
    );
  }
}

class PagePadding {
  EdgeInsets padding30 = const EdgeInsets.all(30);
  EdgeInsets topPadding = const EdgeInsets.only(top: 20);
  EdgeInsets leftPadding = const EdgeInsets.only(left: 20);
  EdgeInsets rightPadding = const EdgeInsets.only(right: 10);
}

class PageHeights {
  double imageHeight = 340;
  double randomContainerHeight = 80;
  double sizedBoxHeight = 90;
}
