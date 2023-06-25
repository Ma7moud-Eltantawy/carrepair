import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mechanic/core/enums.dart';
import 'package:mechanic/core/models/car_model/car_model.dart';
import 'package:mechanic/core/models/user_model/user_model.dart';
import 'package:mechanic/core/networking/request_result.dart';
import 'package:mechanic/data/data_sources/DB_Helper.dart';

abstract class CarBaseDatasource{
  Future<RequestResult<List<CarModel>>> getUserCars();
  Future<RequestResult<void>>Updatecar(CarModel car);
  Future<RequestResult<void>>Createcar(CarModel car);
}

class CarRemopteDataSource implements CarBaseDatasource{
  UserModel ?userdata;
  Future<UserModel> user()=>DB_Helper.getuserfromdb();
  Future<void> getdata()
  async {
    user().then((value) {
      userdata=value;
    });
  }

  @override
  Future<RequestResult<void>> Createcar(CarModel car) async{
    try{

      await getdata();
      final email=userdata!.email;
      final carSnapShot= FirebaseFirestore.instance.collection('users').doc(email).collection('cars').doc();
      await carSnapShot.set(car.toJson());
      return RequestResult(requestState: RequestState.success);
    }
    catch(e)
    {
      log('Error creating car: $e');
      return RequestResult(
        requestState: RequestState.failed,
        errorMessage: e.toString(),
      );
    }
  }




  @override
  Future<RequestResult<void>> Updatecar(CarModel car) async{
    try{
      await getdata();
      final email=userdata!.email;
      final carSnapShot=await FirebaseFirestore.instance.collection('users').doc(email).collection('cars').doc(car.id);
      await carSnapShot.update(car.toJson());
      return RequestResult(requestState: RequestState.success);
    }
    catch(e)
    {
      log('Error creating car: $e');
      return RequestResult(
        requestState: RequestState.failed,
        errorMessage: e.toString(),
      );
    }
  }






  @override
  Future<RequestResult<List<CarModel>>> getUserCars() async{
    try{
      await getdata();
      final email=userdata!.email;
      final carSnapShot=await FirebaseFirestore.instance.collection('users').doc(email).collection('cars').get();

      final cars=carSnapShot.docs.map((doc) =>CarModel.fromJson(id: doc.id,json: doc.data()) ).toList();
      log('cars retrieved successfully : ${cars.map((e) => e.toString())}');
      if (cars.isEmpty) {
        return RequestResult(
          requestState: RequestState.failed,
          errorMessage: 'No cars found for user',
        );
      }
      return RequestResult(
        requestState: RequestState.success,
        data: cars,
      );


    }
    catch(e)
    {
      log('Error creating car: $e');
      return RequestResult(
        requestState: RequestState.failed,
        errorMessage: e.toString(),
      );
    }
  }

}