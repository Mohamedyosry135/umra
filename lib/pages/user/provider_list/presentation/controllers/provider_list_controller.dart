import 'package:umra/lang/translation_service.dart';
import 'package:umra/pages/user/provider_list/data/provider_list_repository.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:umra/pages/user/provider_list/models/search_providers_list.dart';
import 'package:umra/pages/user/urmah_list/models/umra_package_list_model.dart';

class ProviderListController extends SuperController<bool> {
  ProviderListController({required this.providerListRepository});
  final IProviderListRepository providerListRepository;

  RxString dateRange = DateFormat(
    "dd MMM",
  ).format(DateTime.now().add(const Duration(days: 1))).obs;
  PackageData? umrahPackageModel;
  SearchUmrahPackageRequestModel? searchUmrahPackageRequestModel;


  String dateFilter = DateFormat('yyyy-MM-dd').format(DateTime.now());

  @override
  Future<void> onInit() async {
    umrahPackageModel = Get.rootDelegate.arguments();
    getProvidersList(dateFilter);

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
  getProvidersList(date) async {
    change(false, status: RxStatus.loading());
    searchUmrahPackageRequestModel = await providerListRepository.getUmraProvidersList(umrahPackageModel!.id.toString(), date).onError((error, stackTrace) {
      change(true, status: RxStatus.success());
      Get.snackbar("", error.toString());
      throw "";
    });
    change(false, status: RxStatus.success());
  }
}
