import 'package:flutter/material.dart';
import 'package:gym_app/product/index.dart';

class WorkoutCategoriesPage extends StatefulWidget {
  const WorkoutCategoriesPage({super.key});

  @override
  State<WorkoutCategoriesPage> createState() => _WorkoutCategoriesPageState();
}

class _WorkoutCategoriesPageState extends State<WorkoutCategoriesPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    EdgeInsets horizontalPadding = const EdgeInsets.symmetric(horizontal: 28);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: const TitleComponent(
            text: StringConstants.workoutCategoriesTitle,
            size: FontSizes.h4,
            weight: FontWeights.normal),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: Column(children: [
        const SizedBox(
          height: 30,
        ),
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 5,
          child: SizedBox(
            width: 330,
            height: 30,
            child: TabBar(
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blue),
                controller: tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.white,
                labelPadding: const EdgeInsets.symmetric(horizontal: 24),
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
                    ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return CardComponent(
                              cardTitle: StringConstants.cardTitle,
                              cardTypeTitle: StringConstants.cardTypeName,
                              imagePath: ImageEnums.cardImage.toJpg);
                        }),
                    ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return CardComponent(
                              cardTitle: StringConstants.cardTitle,
                              cardTypeTitle: StringConstants.cardTypeName,
                              imagePath: ImageEnums.cardImage.toJpg);
                        }),
                    ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return CardComponent(
                              cardTitle: StringConstants.cardTitle,
                              cardTypeTitle: StringConstants.cardTypeName,
                              imagePath: ImageEnums.cardImage.toJpg);
                        }),
                  ],
                ))),
      ]),
    );
  }
}
