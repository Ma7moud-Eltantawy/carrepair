import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanic/core/enums.dart';
import 'package:mechanic/core/utils/functions.dart';
import 'package:mechanic/data/data_sources/car_datasource.dart';

import 'package:mechanic/features/cars/controller/get_cars_controller.dart';

import '../../../core/models/car_model/car_model.dart';
import '../../../core/models/user_model/user_model.dart';
import '../../../data/data_sources/DB_Helper.dart';

class CreateCarController extends GetxController {
  final CarBaseDatasource _dataSource = CarRemopteDataSource();

  final newCarNameController = TextEditingController();
  final newKilometersController = TextEditingController();
  final newOilKilometersController = TextEditingController();
  final newCheckKilometersController = TextEditingController();
  final newNoteController = TextEditingController();

  bool loading = false;

  changeLoadingValue() {
    loading = !loading;
    update();
  }

  Future<void> createCar() async {
    changeLoadingValue();
    try {
      final car = CarModel(
        carName: newCarNameController.text.trim(),
        kilometers: newKilometersController.text.trim(),
        oilKilometers: newOilKilometersController.text.trim(),
        checkKilometers: newCheckKilometersController.text.trim(),
        note: newNoteController.text.trim(),
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        newKilometersDate: getTodayDate(),
      );

      changeLoadingValue();
      print("step1");
      final result = await _dataSource.Createcar(car);
      print("step2");

      changeLoadingValue();

      if (result.requestState == RequestState.success) {
        Get.back();
        Get.find<GetCarsController>().getCars();
        snackBarSuccess('Car Added successfully');
      } else {
        snackBarError(result.errorMessage ?? 'Error creating car');
      }
    } catch (e) {
      changeLoadingValue();
      snackBarError('Error creating car');
    }
  }

  @override
  void dispose() {
    newCarNameController.dispose();
    newKilometersController.dispose();
    newOilKilometersController.dispose();
    newCheckKilometersController.dispose();
    newNoteController.dispose();
    super.dispose();
  }
}
