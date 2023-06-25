import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanic/core/constants.dart';
import 'package:mechanic/core/enums.dart';
import 'package:mechanic/core/utils/functions.dart';
import 'package:mechanic/data/data_sources/DB_Helper.dart';

import 'package:mechanic/features/home/view/home_screen.dart';

import '../../../core/models/user_model/user_model.dart';
import '../../../data/data_sources/auth_remote_data_source.dart';

class LoginController extends GetxController {
  final BaseAuthDataSource _remoteDataSource = AuthRemoteDataSource();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool loading = false;

  changeLoadingValue() {
    loading = !loading;
    update();
  }

  navigateUserAfterLoginSuccess() {
    Get.offAll(
      () => const HomeScreen(),
      transition: kTransition1,
      duration: kTransitionDuration,
    );
  }

  saveUserInLocal(User user) {
    DB_Helper.Saveuser(user);
  }

  Future login() async {
    changeLoadingValue();
    final result = await _remoteDataSource.login(
      email: emailController.text.trim(),
      pass: passwordController.text,
    );
    if (result.requestState == RequestState.success) {
      if (result.data!.user != null) {
        saveUserInLocal(result.data!.user!);
        navigateUserAfterLoginSuccess();
        changeLoadingValue();
      }
    } else if (result.requestState == RequestState.failed) {
      snackBarError(result.errorMessage!);
      changeLoadingValue();
    }
  }
}
