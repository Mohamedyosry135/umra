import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:umra/pages/provider/my_requests/bindings/my_requests_binding.dart';
import '../../../../user/my_requests/models/my_request_model.dart';
import '../../../my_requests/presentation/controllers/my_requests_controller.dart';
import '../../data/provider_home_repository.dart';

class ProviderHomeController extends SuperController<bool> {
  ProviderHomeController({required this.providerRepository});
  final IproviderHomeRepository providerRepository;

  PageController controller =
      PageController(viewportFraction: 0.86, keepPage: true);

  MyUmraRequestsModel? myUmraRequestsModel;
  getRequests() {
    change(false, status: RxStatus.loading());
    providerRepository.getRequests().then((value) {
      myUmraRequestsModel = value;
      change(true, status: RxStatus.success());
    }).onError((error, stackTrace) {
      change(true, status: RxStatus.error());
      Get.back();
      Get.snackbar("", error.toString());
    });
  }

  @override
  void onInit()  {
    getRequests();
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
