import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mechanic/core/models/user_model/user_model.dart';
import 'package:mechanic/features/cars/view/Add_new_car_screen.dart';

import '../../../core/constants.dart';
import '../../../core/manager/colors_manager.dart';
import '../../cars/widgets/cars_list.dart';
import 'home_widget/home_Drawer.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      drawer: Home_Drawer(user: UserModel(name: "mm",email: "mm",token: "00",imageUrl: "https://firebasestorage.googleapis.com/v0/b/mechanic-72d9a.appspot.com/o/tantawy.jpg?alt=media&token=4c2b7e6a-cef1-403a-b863-2a39ed579a16"),),
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        title: const Text(
          'المساعد الفني',
          style: TextStyle(
            color: ColorsManager.primary,
          ),
        ),
        actions: const [
          _CreateCarButton(),
        ],
      ),
      body: CarsList(),
    );
  }
}
class _CreateCarButton extends StatelessWidget {
  const _CreateCarButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: FloatingActionButton(
        mini: true,
        elevation: 1,
        onPressed: () {
          Get.to(
                () =>  CreateCarScreen(),
            transition: kTransition1,
            duration: kTransitionDuration,
          );
        },
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.add,
          color: ColorsManager.primary,
        ),
      ),
    );
  }
}

