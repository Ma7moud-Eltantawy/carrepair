import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intro_screen_onboarding_flutter/introduction.dart';
import 'package:intro_screen_onboarding_flutter/introscreenonboarding.dart';
import 'package:mechanic/core/app_strings.dart';
import 'package:mechanic/core/constants.dart';
import 'package:mechanic/core/manager/colors_manager.dart';
import 'package:mechanic/core/manager/images_manager.dart';
import 'package:mechanic/core/manager/text_style_manager.dart';
import 'package:mechanic/data/data_sources/DB_Helper.dart';

import '../Auth/view/login_screen.dart';



class OnBoardingView extends StatelessWidget {
  final List<Introduction> list = [
    Introduction(
      imageHeight: 150,
      title: AppStrings.boardingTitle1,
      subTitle: AppStrings.boarding1,
      imageUrl: ImagesManager.boarding1,
      titleTextStyle: getSemiBoldStyle(color: ColorsManager.primary, fontSize: 18),
      subTitleTextStyle: getLightStyle(color: ColorsManager.primary, fontSize: 16),
    ),
    Introduction(
      imageHeight: 150,

      title: AppStrings.boardingTitle2,
      subTitle: AppStrings.boarding2,
      imageUrl: ImagesManager.boarding2,
      titleTextStyle: getSemiBoldStyle(color: ColorsManager.primary, fontSize: 18),
      subTitleTextStyle: getLightStyle(color: ColorsManager.primary, fontSize: 16),
    ),

  ];

  OnBoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroScreenOnboarding(
      introductionList: list,
      backgroudColor: ColorsManager.white,
      skipTextStyle: getLightStyle(color: ColorsManager.primary, fontSize: 0),
      foregroundColor: ColorsManager.primary,
      onTapSkipButton: () {
        DB_Helper.prefs_boardingscreen();
       Get.off(
                ()=> LoginScreen(),
            transition: kTransition1,
            duration: kTransitionDuration
        );
      },
    );
  }
}


