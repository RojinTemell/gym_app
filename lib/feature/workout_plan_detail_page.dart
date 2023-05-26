import 'package:flutter/material.dart';
import 'package:gym_app/feature/workout_categories_page.dart';
import 'package:gym_app/product/index.dart';

class WorkoutDetailPlanPage extends StatefulWidget {
  const WorkoutDetailPlanPage({super.key});

  @override
  State<WorkoutDetailPlanPage> createState() => _WorkoutDetailPlanPageState();
}

class _WorkoutDetailPlanPageState extends State<WorkoutDetailPlanPage>
    with NavigatorManager {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                ImageEnums.workoutPlanDetailPage.toJpg,
                height: 340,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: FloatingActionButton(
                  onPressed: () {
                    navigateToWidget(context, const WorkoutCategoriesPage());
                  },
                  backgroundColor: const Color.fromRGBO(0, 0, 0, 0.2),
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
                    height: 80,
                    decoration: const BoxDecoration(
                      color: ColorsConstants.sharkColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: TitleComponent(
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
              infoContainers(
                iconData: Icons.play_circle,
                text: "60 min",
              ),
              infoContainers(
                iconData: Icons.local_fire_department,
                text: "350 Cal",
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                  width: 350,
                  height: 90,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(StringConstants.workoutDetailPlanDescription),
                  )),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return VideoCardComponent(
                    cardTitle: StringConstants.cardTitle,
                    cardSubtitle: StringConstants.cardTypeName,
                    imagePath: ImageEnums.cardImage.toJpg,
                  );
                }),
          )
        ],
      ),
    );
  }
}

class infoContainers extends StatelessWidget {
  const infoContainers({Key? key, required this.iconData, required this.text})
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
