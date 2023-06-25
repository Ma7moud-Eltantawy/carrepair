import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mechanic/core/manager/colors_manager.dart';
import 'package:mechanic/core/manager/lottie_manager.dart';

class HomeNoCars extends StatelessWidget {
  const HomeNoCars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Lottie.asset(
          LottieManager.carShop,
          filterQuality: FilterQuality.low,
        ),
        Container(
          color: Colors.white.withOpacity(.9),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "لم تقم بإضافة سيارات حتى الان",
                style: TextStyle(color: ColorsManager.primary, fontSize: 20),
              ),

            ],
          ),
        ),
      ],
    );
  }
}
