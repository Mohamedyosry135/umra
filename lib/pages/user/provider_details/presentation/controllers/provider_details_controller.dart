import 'package:umra/pages/user/provider_details/data/provider_details_repository.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:umra/pages/user/provider_details/model/provider_rate_model.dart';
import 'package:umra/pages/user/provider_list/models/search_providers_list.dart';
import 'package:umra/pages/user/urmah_list/models/umra_package_list_model.dart';
import 'package:umra/services/auth_service.dart';


class ProviderDetailsController extends SuperController<bool> {
  ProviderDetailsController({required this.providerDetailsRepository});
  final IProviderDetailsRepository providerDetailsRepository;

  RxString dateRange = DateFormat('d MMM',AuthService.to.language).format(DateTime.now()).obs;

  ProviderRateModel providerRateModel = ProviderRateModel();
  ProviderData providerData = ProviderData();
  PackageData umrahPackageModel = PackageData();

  getProviderRate()async{
    change(false, status: RxStatus.loading());
    providerRateModel = await providerDetailsRepository.getProviderRate(providerData.providerAppUserId.toString()).onError((error, stackTrace) {
      change(true, status: RxStatus.success());
      Get.snackbar("", error.toString());
      throw "";
    });
    change(false, status: RxStatus.success());
  }

  @override
  void onInit() {
    providerData = Get.rootDelegate.arguments()['providerModel'];
    umrahPackageModel = Get.rootDelegate.arguments()['umrahPackageModel'];
    getProviderRate();
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
