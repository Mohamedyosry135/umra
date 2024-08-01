import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:umra/pages/common/my_profile/data/my_profile_repository.dart';

import '../../models/profile_model.dart';

class MyProfileController extends SuperController<bool> {
  MyProfileController({required this.myProfileRepository});

  final IMyProfileRepository myProfileRepository;
  ProfileModel? profileModel;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  void onInit() {
    // TODO: implement onInit
    getProfile();
    super.onInit();
  }

  getProfile() {
    change(false, status: RxStatus.loading());
    myProfileRepository.getProfile().then((value) {
      profileModel = value;
      fullNameController.text = value.result?.data?.fullName ?? "";
      emailController.text = value.result?.data?.email ?? "";
      phoneController.text = value.result?.data?.phoneNumber ?? "";

      change(true, status: RxStatus.success());
    }).onError((error, stackTrace) {
      Get.snackbar("", error.toString());
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
