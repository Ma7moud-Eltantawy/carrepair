import 'package:flutter/material.dart';
import 'package:font_awesome_flutter_named/font_awesome_flutter_named.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mechanic/core/constants.dart';
import 'package:mechanic/core/models/user_model/user_model.dart';
import 'package:mechanic/data/data_sources/auth_remote_data_source.dart';
import 'package:mechanic/features/home/view/home_screen.dart';

import '../../../../core/manager/colors_manager.dart';
import '../../../Auth/view/login_screen.dart';
import '../../../EmergencyNumbersScreen/view/EmergencyNumbersScreen.dart';
import '../../../QuestionsScreen/view/QuestionsScreen.dart';
import '../../../near_workshop/nearworkshop_screen.dart';
import 'drawer_listtile.dart';
class Home_Drawer extends StatelessWidget {
  final UserModel user;
  const Home_Drawer({Key? key,required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
              accountName: Text(user.name),
              accountEmail: Text(user.email),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(user.imageUrl),
              backgroundColor: ColorsManager.white,

            ),
            arrowColor: ColorsManager.white,
            onDetailsPressed: (){
                Get.back();
                Get.to(
                    ()=>HomeScreen(),
                  transition: kTransition1,
                  duration: kTransitionDuration,
                );
            },
          ),
          const SizedBox(height: 30),
          DrawerTile(
            title: 'الرئيسية',
            icon: const Icon(Icons.home_filled),
            onTap: () {},
          ),
          DrawerTile(
            title: 'أقرب ورشة',
            icon: Icon(faIconNameMapping['wrench']!),
            onTap: () {
              Get.to(
                    () => const NearWorkshopScreen(),
                transition: kTransition1,
                duration: kTransitionDuration,
              );
            },
          ),
          DrawerTile(
            title: 'أرقام الطوارئ',
            icon: const Icon(Icons.emergency),
            onTap: () {
              Get.to(
                    () =>  EmergencyNumbersScreen(),
                transition: kTransition1,
                duration: kTransitionDuration,
              );
            },
          ),
          DrawerTile(
            title: 'الاسئلة الشائعة',
            icon: const Icon(Icons.question_answer),
            onTap: () {
              Get.to(
                    () => const QuestionsScreen(),
                transition: kTransition1,
                duration: kTransitionDuration,
              );
            },
          ),
          const Spacer(),
          DrawerTile(
            titleFontWeight: null,
            title: 'تسجيل الخروج',
            icon: const Icon(Icons.logout),
            onTap: () {
              BaseAuthDataSource source = AuthRemoteDataSource();
              source.logout().then((value) {
                Get.offAll(
                      () => LoginScreen(),
                  transition: kTransition1,
                  duration: kTransitionDuration,
                );
              });
            },
          ),


        ],
      ),

    );
  }
}
