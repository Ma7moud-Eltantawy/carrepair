import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_http_request.dart';
import 'package:mechanic/core/theme/theme.dart';
import 'package:mechanic/features/on_boarding/onboarding_screen.dart';
import 'features/Auth/view/login_screen.dart';
import 'features/Splash_screen/splash_screen_view.dart';
import 'firebase_options.dart';
import 'core/Notfication_Services/notfications.dart';
import 'data/data_sources/DB_Helper.dart';
import 'features/home/view/home_screen.dart';
void main() async{


  WidgetsFlutterBinding.ensureInitialized();
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()!.requestPermission();
    await NotificationHelper().initializeNotification();
  await DB_Helper.shprefsinit();

  NotificationHelper().scheduledNotification(msg: "لا تنسى ادخال قراءة العداد الجديده.", hour:12, minutes: 0, id: 1, sound: "notification");

  await initializeDateFormatting('ar_EG', null);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,

  );
   runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //initialBinding: AppBinding(),
      debugShowCheckedModeBanner: false,
      theme: appTheme(context),
      textDirection: TextDirection.rtl,
      home:Splash_screen(),
    );
  }
}


