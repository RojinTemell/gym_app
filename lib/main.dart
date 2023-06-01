import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/feature/first_page.dart';
import 'package:gym_app/product/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  //Notification
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initializeNotification();
  NotificationService().showNotification(1, StringConstants.notificationTitle,
      StringConstants.notificationSubTitle);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> initialization = Firebase.initializeApp();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: ColorsConstants.sharkColor,
      ),
      home: FutureBuilder(
          future: initialization,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(child: Text("Beklenilmeyen Bir Hata Oluştu"));
            } else if (snapshot.hasData) {
              return const FirstPage();
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
