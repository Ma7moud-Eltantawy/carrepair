import 'package:get/get.dart';
import 'package:mechanic/core/enums.dart';
import 'package:mechanic/core/utils/functions.dart';
import 'package:mechanic/data/data_sources/car_datasource.dart';

import '../../../core/models/car_model/car_model.dart';

class GetCarsController extends GetxController{

  final CarBaseDatasource _source = CarRemopteDataSource();
  bool loading= false;

  changeLoadingValue(){
    loading = !loading;
    update();
  }


  List<CarModel> cars = [];


  Future<void> getCars() async{
    changeLoadingValue();

    final result = await _source.getUserCars();
    if(result.requestState == RequestState.success){
      changeLoadingValue();
      cars = result.data!;
    }else{
      changeLoadingValue();
      Get.back();
      if (result.errorMessage != "No cars found for user") {
        snackBarError(result.errorMessage??"Error");
      }
    }
  }



  @override
  void onInit() {
    getCars();
    super.onInit();
  }


}