import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanic/core/manager/colors_manager.dart';
import 'package:mechanic/widgets/animated_column.dart';
import 'package:mechanic/widgets/loading/button_loading.dart';
import 'package:mechanic/widgets/text_field.dart';

import '../../../core/Notfication_Services/notfications.dart';
import '../controller/create_car_controller.dart';

class CreateCarScreen extends StatelessWidget {
  CreateCarScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final CreateCarController controller = Get.put(CreateCarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('بيانات سيارتك'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: GetBuilder<CreateCarController>(
                init: CreateCarController(),
                builder: (cc) {
                  if (cc.loading) {
                    return const ButtonLoading();
                  } else {
                    return FloatingActionButton(
                      mini: true,
                      onPressed: () {

                        if (_formKey.currentState!.validate()) {
                         // controller.createCar();
                        }
                      },
                      backgroundColor: ColorsManager.primary,
                      elevation: 0,
                      child: const Icon(Icons.check),
                    );
                  }
                }),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: _formKey,
            child: AnimatedColumn(
              children: [
                CustomTextFormField(
                  requiredField: true,
                  controller: controller.newCarNameController,
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  label: 'اسم وموديل السيارة',
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  requiredField: true,
                  keyboardType: TextInputType.number,
                  controller: controller.newKilometersController,
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  label: 'الكيومترات في العداد',
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  requiredField: true,
                  keyboardType: TextInputType.number,
                  controller: controller.newOilKilometersController,
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  label: 'الكيلومترات المتبقية على غيار الزيت',
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  requiredField: true,
                  keyboardType: TextInputType.number,
                  controller: controller.newCheckKilometersController,
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  label: 'الكيلومترات المتبقية على الصيانة',
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  requiredField: false,
                  controller: controller.newNoteController,
                  textDirection: TextDirection.rtl,
                  label: 'ملاحظات',
                  maxLines: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
