import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanic/core/manager/colors_manager.dart';
import 'package:mechanic/features/cars/controller/get_cars_controller.dart';
import 'package:mechanic/features/cars/controller/refresh_car_controller.dart';
import 'package:mechanic/widgets/loading/button_loading.dart';
import 'package:mechanic/widgets/text_field.dart';

import '../../../core/models/car_model/car_model.dart';

changeOilDialog(BuildContext context, CarModel car) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return _DialogContent(
        car: car,
      );
    },
  );
}

class _DialogContent extends StatefulWidget {
  const _DialogContent({Key? key, required this.car}) : super(key: key);

  final CarModel car;

  @override
  State<_DialogContent> createState() => _DialogContentState();
}

class _DialogContentState extends State<_DialogContent> {
  late TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController = TextEditingController(text: widget.car.maxOilKM);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 50),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              "تغيير الزيت الان",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: ColorsManager.primary,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            CustomTextFormField(
              keyboardType: TextInputType.number,
              autoFocus: true,
              controller: textEditingController,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              label: 'كيلومترات الزيت',
            ),
            const SizedBox(height: 16.0),
            GetBuilder<RefreshCarController>(
              init: RefreshCarController(),
              builder: (controller) {
                if (controller.loading) {
                  return const ButtonLoading();
                } else {
                  return ElevatedButton(
                    onPressed: () {
                      controller
                          .changeOil(widget.car, textEditingController.text)
                          .then((value) {
                        Get.back();
                        Get.find<GetCarsController>().getCars();
                      });
                    },
                    child: const Text('تغيير'),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
