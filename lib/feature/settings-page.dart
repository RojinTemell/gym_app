import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/feature/gender_select_page.dart';
import 'package:gym_app/feature/login_page.dart';
import 'package:gym_app/feature/workout_categories_page.dart';
import 'package:gym_app/product/index.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> with NavigatorManager {
  bool _switchValue = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Padding(
          padding: EdgeInsets.only(top: 15),
          child: FloatingActionButtonComponent(
            widget: WorkoutCategoriesPage(),
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.only(top: 15),
          child: TitleComponent(
            size: FontSizes.h3,
            weight: FontWeights.semiBold,
            text: StringConstants.settingsText,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(children: [
          const divider(),
          ListTile(
            title: const Text(StringConstants.notificationText),
            trailing: CupertinoSwitch(
              value: _switchValue,
              onChanged: (value) async {
                setState(() {
                  _switchValue = value;
                });
                if (!_switchValue) {
                  NotificationService().cancelNotfication();
                } else {
                  NotificationService().showNotification(
                      1,
                      StringConstants.notificationTitle,
                      StringConstants.notificationSubTitle);
                }
              },
              trackColor: ColorsConstants.tunaColor,
              activeColor: ColorsConstants.blueColor,
            ),
          ),
          const divider(),
          InkWell(
            onTap: () {
              navigateToWidget(context, const GenderSelectPage());
            },
            child: const ListTile(
                title: Text(StringConstants.editText),
                trailing: Icon(Icons.arrow_forward_ios)),
          ),
          const divider(),
          const SizedBox(
            height: 350,
          ),
          const divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Container(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                    navigateToWidget(context, const LoginPage());
                  },
                  child: const Text(
                    'Sign Out',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 17,
                    ),
                  ),
                )),
          ),
          const divider()
        ]),
      ),
    );
  }
}

class divider extends StatelessWidget {
  const divider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Colors.grey,
      height: 0.3,
      thickness: 0.1,
      indent: 16,
      endIndent: 16,
    );
  }
}
