import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:umra/flavors/flavor_config.dart';
import 'package:umra/pages/common/verification_code/data/verfication_code_repository.dart';
import 'package:umra/routes/common_routing/app_pages.dart';

class VerificationCodeController extends SuperController<bool> {
  VerificationCodeController({required this.verificationCodeRepository});

  final IVerificationCodeRepository verificationCodeRepository;

  TextEditingController pinCodeController = TextEditingController();
  String? emailOrPhone;

  bool? userType;
bool? resetPassword;
  @override
  void onInit() {
  resetPassword = Get.rootDelegate.arguments()[0]['resetPassword'];
  emailOrPhone =  Get.rootDelegate.arguments()[1]['email'];
print("emailOrPhone ${emailOrPhone}");
  super.onInit();
    userType = Get.find<MyFlavorConfig>().appNameEnum == AppNameEnum.user;
    change(null, status: RxStatus.success());
  }

  onVerifyClicked() {
    change(false, status: RxStatus.loading());
    var apiResp = verificationCodeRepository
        .verifyCode(pinCodeController.text)
        .then((value) {
        Get.rootDelegate.offNamed(Routes.nextsignupView);
    }, onError: (err) {
      print("ya mosahel ${err}");
      Get.snackbar("", "verification code is wrong");
//use success status to display the login button again
      change(false, status: RxStatus.success());
    });
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
