import 'package:get/get.dart';
import 'package:mechanic/core/enums.dart';
import 'package:mechanic/core/utils/functions.dart';

import '../../../core/models/car_model/car_model.dart';
import '../../../data/data_sources/car_datasource.dart';

class RefreshCarController extends GetxController {
  final CarBaseDatasource _source = CarRemopteDataSource();
  bool loading = false;

  changeLoadingValue() {
    loading = !loading;
    update();
  }

  CarModel _changeCarKilometersModel(CarModel car, String newValue) {
    final int newKilometers = int.parse(newValue);
    CarModel newCarModel = CarModel(
      id: car.id,
      oilKilometers: _getOilKilometers(car, newKilometers).toString(),
      note: car.note,
      carName: car.carName,
      checkKilometers: _getCheckKilometers(car, newKilometers).toString(),
      kilometers: newKilometers.toString(),
      newKilometersDate: getTodayDate(),
    );
    return newCarModel;
  }

  int _getOilKilometers(CarModel car, int newKilometers) {
    final int done = newKilometers - int.parse(car.kilometers);
    return int.parse(car.oilKilometers) - done;
  }

  int _getCheckKilometers(CarModel car, int newKilometers) {
    final int done = newKilometers - int.parse(car.kilometers);
    return int.parse(car.checkKilometers) - done;
  }

  Future updateCarKilometers(CarModel car, String newValue) async {
    changeLoadingValue();
    await _source.Updatecar(_changeCarKilometersModel(car, newValue)).then(
      (result) {
        if (result.requestState == RequestState.success) {
          changeLoadingValue();
        } else {
          changeLoadingValue();
          snackBarError(result.errorMessage ?? "Error");
        }
      },
    );
  }

  CarModel _changeOilModel(CarModel car, String oilMaxKM) {
    CarModel newCarModel = CarModel(
        id: car.id,
        oilKilometers: oilMaxKM,
        note: car.note,
        carName: car.carName,
        checkKilometers: car.checkKilometers,
        kilometers: car.kilometers,
        newKilometersDate: car.newKilometersDate,
        maxOilKM: oilMaxKM);
    return newCarModel;
  }

  Future changeOil(CarModel car, String newValue) async {
    changeLoadingValue();
    await _source.Updatecar(_changeOilModel(car, newValue)).then(
      (result) {
        if (result.requestState == RequestState.success) {
          changeLoadingValue();
        } else {
          changeLoadingValue();
          snackBarError(result.errorMessage ?? "Error");
        }
      },
    );
  }

  CarModel _changeCheckModel(CarModel car, String checkMaxKM) {
    CarModel newCarModel = CarModel(
      id: car.id,
      oilKilometers: car.oilKilometers,
      note: car.note,
      carName: car.carName,
      checkKilometers: checkMaxKM,
      kilometers: car.kilometers,
      newKilometersDate: car.newKilometersDate,
      maxCheckKM: checkMaxKM,
    );
    return newCarModel;
  }

  Future changeCheck(CarModel car, String newValue) async {
    changeLoadingValue();
    await _source.Updatecar(_changeCheckModel(car, newValue)).then(
          (result) {
        if (result.requestState == RequestState.success) {
          changeLoadingValue();
        } else {
          changeLoadingValue();
          snackBarError(result.errorMessage ?? "Error");
        }
      },
    );
  }

  /// [you can replace all these functions that return CarModel using CarModel.copyWith()]
  /// Keep that in mind to change it later
}
