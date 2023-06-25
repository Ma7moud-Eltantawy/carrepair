  import 'package:flutter/material.dart';
  import 'package:get/get.dart';
  import 'package:mechanic/features/cars/controller/get_cars_controller.dart';
  import 'package:mechanic/widgets/loading/button_loading.dart';
  import 'package:mechanic/widgets/text_field.dart';

import '../../../core/models/car_model/car_model.dart';
import '../controller/refresh_car_controller.dart';

  changeCarKilometersDialog(BuildContext context, CarModel car) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return _DialogContent(
          car: car,
        );
      },
    );
  }

  class _DialogContent extends StatelessWidget {
    _DialogContent({Key? key, required this.car}) : super(key: key);

    final CarModel car;
    final TextEditingController newKilometersController = TextEditingController();

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
              CustomTextFormField(
                keyboardType: TextInputType.number,
                autoFocus: true,
                controller: newKilometersController,
                contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 0),
                label: 'الكيلومترات الحاليه في العداد',
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
                            .updateCarKilometers(car, newKilometersController.text)
                            .then((value) {
                          Get.back();
                          Get.find<GetCarsController>().getCars();
                        });
                      },
                      child: const Text('تحديث'),
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
