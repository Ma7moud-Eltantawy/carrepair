import 'package:flutter/material.dart';

import '../../core/manager/colors_manager.dart';
import 'near_workshop_button.dart';
class NearWorkshopScreen extends StatelessWidget {
  const NearWorkshopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'أقرب ورشة',
          style: TextStyle(
            color: ColorsManager.primary,
          ),
        ),
      ),
      body: GridView.count(crossAxisCount: 2,mainAxisSpacing: 10,crossAxisSpacing: 10,padding: EdgeInsets.symmetric(horizontal: 10),primary: false,
      physics: const BouncingScrollPhysics(),
        children: [
          NearWorkShopButton(
            title: 'ميكانيكي',
            query: "ميكانيكي سيارات",
            img: "assets/images/muscular-car-service-worker-repairing-vehicle.jpg",
          ),
          NearWorkShopButton(
            title: 'عفشه',
            query: "ورشة عفشه",
            img: "assets/images/auto-mechanic-checking-car .jpg",
          ),
          NearWorkShopButton(
            title: 'كهربائي',
            query: "كهربائي سيارات",
            img: "assets/images/car-repairman-wearing-white-uniform-standing-holding-wrench-that-is-essential-tool-mechanic.jpg",
          ),
          NearWorkShopButton(
            title: 'كاوتش',
            query: "ورشة كاوتش سيارات",
            img: "assets/images/technician-is-inflate-car-tire-car-maintenance-service-transportation-safety-concept.jpg",

          ),
          NearWorkShopButton(
            title: 'تغيير زيت',
            query: "ورشة تغيير زيت سيارات",
            img: "assets/images/mechanic-changing-engine-oil-car-vehicle.jpg",
          ),
          NearWorkShopButton(
            title: 'بنزينه',
            query: "اقرب بنزينه",
            img: "assets/images/man-gas-station-with-car-close-up.jpg",
          ),
          NearWorkShopButton(
            title: 'مغسله',
            query: "اقرب مغسلة سيارات",
            img: "assets/images/professional-washer-blue-uniform-washing-luxury-car-with-water-gun-open-air-car-wash.jpg",
          ),
          NearWorkShopButton(
            title: 'مركز صيانه',
            query: "مركز صيانة سيارات",
            img: "assets/images/cars-lifting-maintenance-garage-service-station.jpg",
          ),
        ],


      ),
    );
  }
}
