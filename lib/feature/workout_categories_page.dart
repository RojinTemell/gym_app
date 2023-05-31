import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/feature/settings-page.dart';
import 'package:gym_app/feature/workout_plan_detail_page.dart';
import 'package:gym_app/product/index.dart';

class WorkoutCategoriesPage extends StatefulWidget {
  const WorkoutCategoriesPage({super.key});

  @override
  State<WorkoutCategoriesPage> createState() => _WorkoutCategoriesPageState();
}

class _WorkoutCategoriesPageState extends State<WorkoutCategoriesPage>
    with TickerProviderStateMixin, NavigatorManager {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    EdgeInsets horizontalPadding = const EdgeInsets.symmetric(horizontal: 28);
    double height30 = 30;
    double tabbarWidth = 330;
    BorderRadius borderRadius15 = BorderRadius.circular(15);
    EdgeInsets labelPaddingHorizontal =
        const EdgeInsets.symmetric(horizontal: 24);

//get data

    List<String> cards = [];

    Future getCards() async {
      await FirebaseFirestore.instance
          .collection('cards')
          .get()
          .then((snapshot) => snapshot.docs.forEach((document) {
                cards.add(document.reference.id);
              }));
    }

    void initState() {
      getCards();
      super.initState();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const TitleComponent(
            text: StringConstants.workoutCategoriesTitle,
            size: FontSizes.h4,
            weight: FontWeights.normal),
        actions: [
          IconButton(
            onPressed: () {
              navigateToWidget(context, const SettingsPage());
            },
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: Column(children: [
        SizedBox(
          height: height30,
        ),
        Card(
          shape: RoundedRectangleBorder(borderRadius: borderRadius15),
          elevation: 5,
          child: SizedBox(
            width: tabbarWidth,
            height: height30,
            child: TabBar(
                indicator: BoxDecoration(
                    borderRadius: borderRadius15, color: Colors.blue),
                controller: tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.white,
                labelPadding: labelPaddingHorizontal,
                indicatorSize: TabBarIndicatorSize.tab,
                isScrollable: true,
                tabs: const [
                  Tab(child: Text("Beginner")),
                  Tab(child: Text("Intermediate")),
                  Tab(child: Text("Advance")),
                ]),
          ),
        ),
        Expanded(
            child: Padding(
                padding: horizontalPadding,
                child: TabBarView(
                  controller: tabController,
                  children: [
                    FutureBuilder(
                      future: getCards(),
                      builder: (context, snapshot) {
                        return ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: cards.length,
                            itemBuilder: (context, index) {
                              return CardComponent(
                                cardTitle: StringConstants.cardTitle,
                                cardTypeTitle: StringConstants.cardTypeName,
                                imagePath: ImageEnums.cardImage.toJpg,
                                widget: const WorkoutDetailPlanPage(),
                              );
                            });
                      },
                    ),
                    ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return CardComponent(
                              cardTitle: StringConstants.cardTitle,
                              cardTypeTitle: StringConstants.cardTypeName,
                              imagePath: ImageEnums.cardImage.toJpg,
                              widget: const WorkoutDetailPlanPage());
                        }),
                    ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return CardComponent(
                              cardTitle: StringConstants.cardTitle,
                              cardTypeTitle: StringConstants.cardTypeName,
                              imagePath: ImageEnums.cardImage.toJpg,
                              widget: const WorkoutDetailPlanPage());
                        }),
                  ],
                ))),
      ]),
    );
  }
}
