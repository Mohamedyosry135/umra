import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:umra/lang/translation_service.dart';

import '../../data/forget_password_repository.dart';

class ForgetPasswordController extends SuperController<dynamic> {
  ForgetPasswordController({required this.forgetPasswordRepository});

  final IForgetPasswordRepository forgetPasswordRepository;

  TextEditingController emailController = TextEditingController();


  onClickResetPassword(){
    change(false,status: RxStatus.loading());
    forgetPasswordRepository.resetPassword(emailController.text).then((value){
      if(value.isSuccess ??false){
        change(true,status: RxStatus.success());

        Get.back();
        Get.snackbar("", CommonLang.linkSent.tr());

      }else{
        Get.snackbar("", CommonLang.tryAgain.tr());
        change(true,status: RxStatus.success());

      }

    }).onError((error, stackTrace){
      change(true,status: RxStatus.success());

      // print(error.);
      Get.snackbar("", error.toString());

    });
  }
  @override
  void onInit() {
    // TODO: implement onInit
    change(true,status: RxStatus.success());
    super.onInit();
  }
  @override
  void onDetached() {
    // TODO: implement onDetached
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
  }

  @override
  void onPaused() {
    // TODO: implement onPaused
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
  }
}