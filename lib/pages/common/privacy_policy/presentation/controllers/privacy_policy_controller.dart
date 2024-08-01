import 'package:umra/pages/common/privacy_policy/data/privacy_policy_repository.dart';
import 'package:umra/pages/common/splash/data/splash_repository.dart';
import 'package:umra/pages/common/terms_conditions/data/terms_condition_repository.dart';
import 'package:umra/pages/common/terms_conditions/models/terms_conditions_model.dart';
import 'package:umra/routes/common_routing/app_pages.dart';
import 'package:umra/services/auth_service.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class PrivacyPolicyController extends SuperController<dynamic> {
  PrivacyPolicyController({required this.privacyPolicyRepository});

  TermsAndConditionsModel? termsAndConditionsModel;
  final IPrivacyPolicyRepository privacyPolicyRepository;
  @override
  void onInit() async {
    super.onInit();
    getPrivacyPolicy();

  }

  getPrivacyPolicy(){
    change(false, status: RxStatus.loading());
    privacyPolicyRepository.getPrivacyPolicy().then((value){
      termsAndConditionsModel = value;
      change(true, status: RxStatus.success());

    }).onError((error, stackTrace){
      Get.back();
      print(error.toString());
      Get.snackbar("",error.toString());
      change(true, status: RxStatus.success());
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
