import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mechanic/features/Auth/controller/signup_controller.dart';

import '../../../core/constants.dart';
import '../../../core/manager/colors_manager.dart';
import '../../../widgets/button_loading.dart';
import '../../../widgets/default_button.dart';
import '../../../widgets/text_field.dart';
class Signupscreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final signupcontroller controller = Get.put(signupcontroller());
   Signupscreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:AppBar(
        title: const Text(
          'تسجيل الدخول',
          style: TextStyle(color: ColorsManager.primary, fontSize: 16),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: FadeIn(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      controller: controller.emailController,
                      label: 'البريد الالكتروني',
                      requiredField: true,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      controller: controller.passwordController,
                      label: 'كلمة المرور',
                      isPassword: true,
                      requiredField: true,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    GetBuilder<signupcontroller>(
                      builder: (cc) {
                        if (cc.loading) {
                          return const ButtonLoading();
                        } else {
                          return DefaultButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                controller.signup();
                              }
                            },
                            text: 'إنشاء حساب',
                          );
                        }
                      },
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
