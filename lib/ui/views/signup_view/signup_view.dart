import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:meal_monkey/core/translation/app_translation.dart';
import 'package:meal_monkey/ui/shared/colors.dart';

import 'package:meal_monkey/ui/shared/custom_widgets/custom_text.dart';

import 'package:meal_monkey/ui/views/login_view/login_view.dart';
import 'package:meal_monkey/ui/views/signup_view/signup_controller.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  SignupController controller = SignupController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: '${tr('key_signup_view_have_account')} ',
              textColor: AppColors.secondaryGreyColor,
            ),
            InkWell(
              onTap: () {
                Get.off(() => LoginView());
              },
              child: CustomText(
                text: ' ${tr('key_login')}',
                textColor: AppColors.mainOrangeColor,
              ),
            ),
          ],
        ),
              )

          );



  }
}
