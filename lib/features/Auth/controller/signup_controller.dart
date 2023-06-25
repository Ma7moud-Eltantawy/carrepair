import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mechanic/data/data_sources/auth_remote_data_source.dart';

import '../../../core/constants.dart';
import '../../../core/enums.dart';
import '../../../core/utils/functions.dart';

class signupcontroller extends GetxController{
  BaseAuthDataSource _remoteDataSource= AuthRemoteDataSource();
  TextEditingController emailController=new TextEditingController();
  TextEditingController passwordController=new TextEditingController();

  bool loading=false;
  changeLoadingValue() {
    loading = !loading;
    update();
  }
  /*navigateUserAfterSignUpSuccess() {
    Get.offAll(
          () => const HomeScreen(),
      transition: kTransition1,
      duration: kTransitionDuration,
    );
  }*/

  /*saveUserInLocal(User user) {
    HiveHelper.hiveSaveUser(
      UserModel(
        name: getNameFromEmail(user.email!),
        email: user.email!,
        token: user.uid,
      ),
    );
  }*/

  Future signup() async {
    changeLoadingValue();
    final result = await _remoteDataSource.signup(
      email: emailController.text.trim(),
      pass: passwordController.text,
    );
    if (result.requestState == RequestState.success) {
      if (result.data!.user != null) {
        //saveUserInLocal(result.data!.user!);
       // navigateUserAfterLoginSuccess();
        changeLoadingValue();
      }
    } else if (result.requestState == RequestState.failed) {
      snackBarError(result.errorMessage!);
      changeLoadingValue();
    }
  }

}